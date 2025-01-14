import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/utils/de_toast.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class IssueCard extends StatelessWidget {
  const IssueCard({super.key});

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
      'YYYY.m.dd',
      style: cation12M.copyWith(color: grey50),
    );
  }

  Widget _issueTitle() {
    return DeGestureDetector(
      onTap: () {
        DeToast.showToast(
          msg: '아무거나',
        );
      },
      child: DeText(
        '우주 광물 채굴에 대한 정부 규제는 올바른가요?우주 광물 채굴에 대한 정부 규제는 올바른가요?',
        style: body16Sb.copyWith(
          color: Color(0xFFF3F0F4),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _issueRecent() {
    return DeText(
      '3분 전 대화',
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

    return Container(
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
            '50%',
            style: header,
          ),
          DeText(
            '4,321표',
            style: cation12M,
          ),
        ],
      ),
    );
  }
}
