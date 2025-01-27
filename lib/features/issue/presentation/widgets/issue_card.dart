import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class IssueCard extends StatelessWidget {
  final ChatRoomRes? chatroom;

  const IssueCard({
    super.key,
    required this.chatroom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: BoxDecoration(
        color: grey120,
        border: Border.all(color: grey90),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _issueDate(),
          _issueTitle(),
          Gaps.v12,
          _issueRecent(),
          Gaps.v12,
          _issueStatus(),
        ],
      ),
    );
  }

  Widget _issueDate() {
    return DeText(
      chatroom?.createdAt.substring(0, 10) ?? '----.-.--',
      style: cation12M.copyWith(color: grey50),
    );
  }

  Widget _issueTitle() {
    return DeGestureDetector(
      onTap: () {
        Get.toNamed(GetRouterName.debate, arguments: {
          'chatroom_id': chatroom?.chatRoomId,
        });
      },
      child: DeText(
        chatroom!.title,
        style: body16Sb.copyWith(
          color: Color(0xFFF3F0F4),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _issueRecent() {
    return DeText(
      '최근', //'3분 전 대화', todo: 대화 시간 표시
      style: cation12M.copyWith(color: brandColor),
    );
  }

  Widget _issueStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _widgetBtn('찬성'),
        Gaps.h8,
        DeText(
          'VS',
          style: cation12M.copyWith(color: grey70),
        ),
        Gaps.h8,
        _widgetBtn('반대'),
      ],
    );
  }

  Widget _widgetBtn(String data) {
    final widgetColor = data == '찬성' ? red : blue;

    int agree = chatroom?.agree ?? 0;
    int disagree = chatroom?.disagree ?? 0;
    int total = agree + disagree;
    double agreeRatio = agree / total;
    double disagreeRatio = disagree / total;

    if (total == 0) {
      agreeRatio = 0;
      disagreeRatio = 0;
    }
    String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
    String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

    return Container(
      width: 80,
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: ShapeDecoration(
        color: widgetColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.32),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeText(
            data,
            style: cation12SB,
          ),
          DeText(
            data == '찬성' ? agreeRatioText : disagreeRatioText,
            style: header,
          ),
          DeText(
            data == '찬성' ? '$agree표' : '$disagree표',
            style: cation12M,
          ),
        ],
      ),
    );
  }
}
