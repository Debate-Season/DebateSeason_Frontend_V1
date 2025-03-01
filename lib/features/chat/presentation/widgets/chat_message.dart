import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/chat/chat_constants.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/utils/date_format_util.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatMessage extends StatelessWidget {
  final ChatMessageEntity chatMessageEntity;
  final bool withDateLine;

  const ChatMessage(this.chatMessageEntity,
      {super.key, required this.withDateLine});

  @override
  Widget build(BuildContext context) {
    final alignment = chatMessageEntity.opinionType == ChatConstants.chatAgree
        ? Alignment.centerLeft
        : Alignment.centerRight;
    final crossAxisAlignment =
        chatMessageEntity.opinionType == ChatConstants.chatAgree
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end;
    final color = chatMessageEntity.opinionType == ChatConstants.chatAgree
        ? DeColors.redDark
        : DeColors.blueDark;

    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (withDateLine) _dateline(chatMessageEntity.timeStamp),
          _chatMessageHeader(
            sender: chatMessageEntity.sender,
            userCommunity: chatMessageEntity.userCommunity,
            timeStamp: chatMessageEntity.timeStamp,
          ),
          DeGaps.v4,
          _chatMessageBody(
            color: color,
            content: chatMessageEntity.content,
          ),
        ],
      ),
    );
  }
}

Widget _chatMessageHeader(
    {required String sender,
    required String userCommunity,
    required String timeStamp}) {
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
        _formatMessageTime(timeStamp),
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
    child: DeText(
      content,
      style: DeFonts.body14M,
    ),
  );
}

Widget _dateline(String timeStamp) {
  final date = DateTime.parse(timeStamp);

  String dateString;
  if (DateFormatUtil.isToday(date)) {
    dateString = "오늘";
  } else if (DateFormatUtil.isYesterday(date)) {
    dateString = "오늘";
  } else {
    dateString = "${date.year}.${date.month}.${date.day}";
  }

  return Align(
    child: Container(
      padding: DeDimensions.padding12x4,
      decoration: BoxDecoration(
        color: DeColors.grey90,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: DeText(
        dateString,
        style: DeFonts.caption12R.copyWith(color: DeColors.grey50),
      ),
    ),
  );
}

String _formatMessageTime(String timeStamp) {
  final time = DateTime.parse(timeStamp);
  return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
}
