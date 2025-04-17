import 'package:any_link_preview/any_link_preview.dart';
import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';
import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatMessage extends StatefulWidget {
  final ChatMessageEntity chatMessageEntity;
  final double parentHeight;
  final void Function(int) onInappropriateChatReport;

  const ChatMessage(this.chatMessageEntity,
      {super.key,
      required this.parentHeight,
      required this.onInappropriateChatReport});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  // void _showReactionModal(
  //   BuildContext context,
  //   GlobalKey messageKey,
  //   Alignment aligntment,
  //   String? link,
  // ) {
  //   final RenderBox renderBox =
  //       messageKey.currentContext!.findRenderObject() as RenderBox;
  //   final Offset position = renderBox.localToGlobal(Offset.zero);
  //   final linkHeight = (link == null) ? 0 : 220; // 220 is Preview Size
  //   final Size chatBubbleSize = Size(
  //       renderBox.size.width, renderBox.size.height - linkHeight); // 메시지 크기

  //   double pickerTop;
  //   // bubble 하단에 이미지 픽커가 Default
  //   // bubble 하단에서 시현해서 잘려질 경우, 위쪽에 표시
  //   if (widget.parentHeight <
  //       position.dy - kToolbarHeight + chatBubbleSize.height + 84) {
  //     pickerTop = position.dy -
  //         kToolbarHeight -
  //         84 +
  //         20 -
  //         6; // 84 is reaction picker size 20 is chat header 6 is gap
  //   } else {
  //     pickerTop = position.dy - kToolbarHeight + chatBubbleSize.height;
  //   }

  //   final right =
  //       aligntment == Alignment.centerRight ? 20.0 : null; // 20 padding
  //   final left = aligntment == Alignment.centerLeft ? 20.0 : null; // 20 padding

  //   showDialog(
  //     context: context,
  //     barrierColor: Colors.transparent,
  //     builder: (context) {
  //       return Stack(
  //         children: [
  //           Positioned(
  //             top: pickerTop,
  //             right: right,
  //             left: left,
  //             child: Material(
  //               color: Colors.transparent,
  //               child: ReactionPicker(
  //                 onReactionSelect: (emoji) {
  //                   Navigator.pop(context);
  //                 },
  //                 onInappropriateChatReport: () => widget
  //                     .onInappropriateChatReport(widget.chatMessageEntity.id),
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final messageKey = GlobalKey();

    final alignment = widget.chatMessageEntity.opinionType == OpinionType.agree
        ? Alignment.centerLeft
        : Alignment.centerRight;
    final crossAxisAlignment =
        widget.chatMessageEntity.opinionType == OpinionType.agree
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end;
    final color = widget.chatMessageEntity.opinionType == OpinionType.agree
        ? DeColors.redDark
        : DeColors.blueDark;

    RegExp urlRegExp = RegExp(
      r'https:\/\/[^\s]+', // https://로 시작하는 URL
      caseSensitive: true,
    );

    final content = widget.chatMessageEntity.content;
    Iterable<Match> matches = urlRegExp.allMatches(content);
    final link = matches.isNotEmpty
        ? content.substring(matches.first.start, matches.first.end)
        : null;

    return Align(
      alignment: alignment,
      child: GestureDetector(
        key: messageKey,
        // onLongPress: () =>
        //     _showReactionModal(context, messageKey, alignment, link),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            _chatMessageHeader(
              sender: widget.chatMessageEntity.sender,
              userCommunity: widget.chatMessageEntity.userCommunity,
              timeStamp: widget.chatMessageEntity.timeStamp,
            ),
            DeGaps.v4,
            _chatMessageBody(
              color: color,
              content: widget.chatMessageEntity.content,
            ),
            if (link != null) DeGaps.v8,
            if (link != null) _preview(link)
          ],
        ),
      ),
    );
  }

  Widget _chatMessageHeader(
      {required String sender,
      required String userCommunity,
      required DateTime timeStamp}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xFFE2B84C),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        DeGaps.h4,
        DeText(sender,
            style: DeFonts.caption12SB.copyWith(color: DeColors.grey10)),
        DeGaps.h4,
        DeText(
          userCommunity,
          style: DeFonts.caption12R.copyWith(color: DeColors.grey30),
        ),
        DeGaps.h4,
        SvgPicture.asset(DeIcons.icDotGrey50),
        DeGaps.h4,
        DeText(
          '${timeStamp.hour}:${timeStamp.minute.toString().padLeft(2, '0')}',
          style: DeFonts.caption12R.copyWith(color: DeColors.grey30),
        ),
      ],
    );
  }

  Widget _chatMessageBody({
    required String content,
    required Color color,
  }) {
    return Container(
      padding: DeDimensions.all12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Linkify(
        onOpen: (link) async {
          final Uri url = Uri.parse(link.url);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        text: content,
        style: DeFonts.body14M.copyWith(decorationColor: Colors.blue),
      ),
    );
  }

  Widget _preview(String link) {
    // final text = previewData == null ? content : "";
    return SizedBox(
      width: 265,
      child: AnyLinkPreview(
        link: link,
        placeholderWidget: SizedBox(
          height: 100,
          width: 100,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        displayDirection: UIDirection.uiDirectionVertical,
        showMultimedia: true,
        bodyMaxLines: 3,
        bodyTextOverflow: TextOverflow.ellipsis,
        titleStyle: DeFonts.caption12M,
        bodyStyle: TextStyle(color: DeColors.grey10, fontSize: 12),
        backgroundColor: DeColors.grey90,
        cache: Duration(days: 3),
        boxShadow: [],
        borderRadius: 12,
      ),
    );
  }
}
