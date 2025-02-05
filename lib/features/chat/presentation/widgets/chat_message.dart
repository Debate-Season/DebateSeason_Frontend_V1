import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/chat/chat_constants.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/chat_message_type.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatMessage extends StatelessWidget {
  final ChatMessageEntity message;

  const ChatMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.messageType == ChatMessageType.date.value) {
      return _dateline();
    }

    switch (message.opinionType) {
      case ChatConstants.chatAgree:
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _chatMessageHeader(),
              Gaps.v4,
              _chatMessageBody(
                backgroundColor: redDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ],
          ),
        );
      case ChatConstants.chatDisagree:
        return Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _chatMessageHeader(),
              Gaps.v4,
              _chatMessageBody(
                backgroundColor: blueDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ],
          ),
        );
      default:
        return Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _chatMessageHeader(),
              Gaps.v4,
              _chatMessageBody(
                backgroundColor: blueDark,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
        );
    }
  }

  Widget _chatMessageHeader() {
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
        Gaps.h4,
        DeText(
          message.sender,
          style: cation12SB.copyWith(color: grey10),
        ),
        Gaps.h4,
        DeText(
          message.userCommunity,
          style: cation12R.copyWith(color: grey30),
        ),
        Gaps.h4,
        SvgPicture.asset('assets/icons/ic_dot_grey50.svg'),
        Gaps.h4,
        DeText(
          _formatMessageTime(time: message.timeStamp),
          style: cation12R.copyWith(color: grey30),
        ),
      ],
    );
  }

  Widget _chatMessageBody({
    required Color backgroundColor,
    required BorderRadius borderRadius,
  }) {
    return Container(
      padding: Dimensions.all12,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: DeText(
        message.content,
        style: body14M,
      ),
    );
  }

  Widget _dateline() {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Container(
          padding: Dimensions.padding12x4,
          decoration: BoxDecoration(
            color: grey90,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: DeText(
            message.content,
            style: cation12R.copyWith(color: grey50),
          ),
        ),
      ],
    );
  }

  String _formatMessageTime({required DateTime? time}) {
    if (time == null) {
      return '';
    }

    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
