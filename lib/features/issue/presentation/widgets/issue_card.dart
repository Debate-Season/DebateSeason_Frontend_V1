import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/features/issue/domain/entities/chat_room_entity.dart';
import 'package:debateseason_frontend_v1/features/issue/issue_constants.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:debateseason_frontend_v1/widgets/de_vote_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IssueCard extends StatelessWidget {
  final ChatRoomEntity chatroom;

  const IssueCard({
    super.key,
    required this.chatroom,
  });

  @override
  Widget build(BuildContext context) {
    bool isVoted = chatroom.opinion != 'NEUTRAL';
    return Column(
      children: [
        Container(
          padding: isVoted
              ? const EdgeInsets.all(16)
              : const EdgeInsets.fromLTRB(16, 16, 16, 20),
          decoration: BoxDecoration(
            color: DeColors.grey110,
            border: Border.all(color: DeColors.grey90),
            borderRadius: isVoted
                ? BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  )
                : BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _issueDate(),
              DeGaps.v2,
              _issueTitle(),
              DeGaps.v8,
              _issueRecent(),
              DeGaps.v8,
              _issueStatus(),
            ],
          ),
        ),
        if (isVoted) _issueVoted(),
      ],
    );
  }

  Widget _issueDate() {
    return DeText(
      DateFormat('yyyy.M.d')
          .format(DateTime.parse(chatroom.createdAt.toString())),
      style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
    );
  }

  Widget _issueTitle() {
    return DeText(
      chatroom.title,
      style: DeFonts.body16Sb.copyWith(
        color: Color(0xFFF3F0F4),
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget _issueRecent() {
    return DeText(
      '최근', //'3분 전 대화', todo: 대화 시간 표시
      style: DeFonts.caption12M.copyWith(color: DeColors.brand),
    );
  }

  Widget _issueStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DeVoteButton(
          isPros: true,
          agree: chatroom.agree,
          disagree: chatroom.disagree,
          myOpinion: chatroom.opinion,
        ),
        DeGaps.h8,
        DeText(
          IssueConstants.vs,
          style: DeFonts.caption12M.copyWith(color: DeColors.grey70),
        ),
        DeGaps.h8,
        DeVoteButton(
          isPros: false,
          agree: chatroom.agree,
          disagree: chatroom.disagree,
          myOpinion: chatroom.opinion,
        ),
      ],
    );
  }

  Widget _issueVoted() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: DeColors.brand,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      alignment: Alignment.center,
      child: DeText(
        '참여 중',
        style: DeFonts.caption12SB.copyWith(color: DeColors.grey10),
      ),
    );
  }
}
