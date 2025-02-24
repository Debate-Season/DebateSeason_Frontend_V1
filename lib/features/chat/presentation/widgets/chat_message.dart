import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/chat/chat_constants.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/chat_message_model.dart';
import 'package:debateseason_frontend_v1/utils/date_format_util.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatMessage extends StatelessWidget {
  final ChatMessageModel chatMessageModel;
  final bool withDateLine;

  const ChatMessage(this.chatMessageModel,
      {super.key, required this.withDateLine});

  @override
  Widget build(BuildContext context) {
    switch (chatMessageModel.opinionType) {
      case ChatConstants.chatAgree:
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (withDateLine) Align(child: _dateline()),
              _chatMessageHeader(),
              DeGaps.v4,
              _chatMessageBody(
                backgroundColor: DeColors.redDarkOnGrey,
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
              DeGaps.v4,
              _chatMessageBody(
                backgroundColor: DeColors.blueDarkOnGrey,
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
              DeGaps.v4,
              _chatMessageBody(
                backgroundColor: DeColors.blueDarkOnGrey,
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
        DeGaps.h4,
        DeText(
          chatMessageModel.sender,
          style: DeFonts.caption12SB.copyWith(color: DeColors.grey10),
        ),
        DeGaps.h4,
        DeText(
          chatMessageModel.userCommunity,
          style: DeFonts.caption12R.copyWith(color: DeColors.grey30),
        ),
        DeGaps.h4,
        SvgPicture.asset(DeIcons.icDotGrey50),
        DeGaps.h4,
        DeText(
          // chatMessageModel.timeStamp,
          _formatMessageTime(time: DateTime.parse(chatMessageModel.timeStamp)),
          style: DeFonts.caption12R.copyWith(color: DeColors.grey30),
        ),
      ],
    );
  }

  Widget _chatMessageBody({
    required Color backgroundColor,
    required BorderRadius borderRadius,
  }) {
    return Container(
      padding: DeDimensions.all12,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: DeText(
        chatMessageModel.content,
        style: DeFonts.body14M,
      ),
    );
  }

  Widget _dateline() {
    final date = DateTime.parse(chatMessageModel.timeStamp);

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

  String _formatMessageTime({required DateTime? time}) {
    if (time == null) {
      return '';
    }

    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
