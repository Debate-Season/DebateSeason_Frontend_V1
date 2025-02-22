import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';
import 'package:debateseason_frontend_v1/features/issue/issue_constants.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class IssueCard extends StatelessWidget {
  final ChatRoomRes? chatroom;

  //final Future<List<String>> Function(int) callback;
  //final List<String> percent;

  const IssueCard({
    super.key,
    required this.chatroom,
    //required this.callback,
    //required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: BoxDecoration(
        color: DeColors.grey120,
        border: Border.all(color: DeColors.grey90),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _issueDate(),
          _issueTitle(),
          DeGaps.v12,
          //_issueRecent(),
          //Gaps.v12,
          _issueStatus(),
        ],
      ),
    );
  }

  Widget _issueDate() {
    return DeText(
      chatroom?.createdAt.substring(0, 10) ?? '----.-.--',
      style: DeFonts.caption12M.copyWith(color: DeColors.grey50),
    );
  }

  Widget _issueTitle() {
    return DeText(
      chatroom!.title,
      style: DeFonts.body16Sb.copyWith(
        color: Color(0xFFF3F0F4),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _issueRecent() {
    return DeText(
      '최근', //'3분 전 대화', todo: 대화 시간 표시
      style: DeFonts.caption12M.copyWith(color: DeColors.brandColor),
    );
  }

  Widget _issueStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _widgetBtn('찬성'),
        DeGaps.h8,
        DeText(
          IssueConstants.vs,
          style: DeFonts.caption12M.copyWith(color: DeColors.grey70),
        ),
        DeGaps.h8,
        _widgetBtn('반대'),
      ],
    );
  }

  Widget _widgetBtn(String data) {
    final widgetColor = data == '찬성' ? DeColors.red : DeColors.blue;

    // int agree = chatroom?.agree ?? 0;
    // int disagree = chatroom?.disagree ?? 0;
    // int total = agree + disagree;
    // double agreeRatio = agree / total;
    // double disagreeRatio = disagree / total;
    //
    // if (total == 0) {
    //   agreeRatio = 0;
    //   disagreeRatio = 0;
    // }
    // String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
    // String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

    final issueId = 1;
    //viewmodel에 정의된 getPercentages 함수 호출
    //final percentages = getPercentages(issueId);
    final percentages = [1, 1, 1, 1];
    final agree = percentages[0];
    final disagree = percentages[1];
    final agreeRatioText = percentages[2];
    final disagreeRatioText = percentages[3];

    return Container(
      width: 80,
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 7,
      ),
      decoration: ShapeDecoration(
        color: widgetColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeText(
            data,
            style: DeFonts.caption12M2,
          ),
          DeText(
            data == '찬성' ? '$agreeRatioText%' : '$disagreeRatioText%',
            style: DeFonts.header,
          ),
          DeText(
            data == '찬성' ? '$agree표' : '$disagree표',
            style: DeFonts.caption12M2,
          ),
        ],
      ),
    );
  }
}
