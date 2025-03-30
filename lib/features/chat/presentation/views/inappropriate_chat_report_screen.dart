import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/custom_checkbox.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InappropriateChatReportScreen extends StatefulWidget {
  const InappropriateChatReportScreen({super.key});

  @override
  State<InappropriateChatReportScreen> createState() =>
      _InappropriateChatReportScreenState();
}

class _InappropriateChatReportScreenState
    extends State<InappropriateChatReportScreen> {
  List<bool> isCheckedList = List.generate(7, (index) => false); // 체크 상태 리스트

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: DeAppBar(
          title: Text(
        "신고하기",
        style: DeFonts.header20B,
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Text(
              "허위 신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 유의해주세요.",
              style: DeFonts.body14M.copyWith(color: DeColors.grey30),
            ),
            DeGaps.v28,
            renderCheckbox("욕설, 비방, 차별, 혐오", 0),
            DeGaps.v20,
            renderCheckbox("음란, 청소년 유해", 1),
            DeGaps.v20,
            renderCheckbox("허위, 불법 정보", 2),
            DeGaps.v20,
            renderCheckbox("도배, 스팸", 3),
            DeGaps.v20,
            renderCheckbox("홍보, 영리목적", 4),
            DeGaps.v20,
            renderCheckbox("개인 정보 노출, 유포, 거래", 5),
            DeGaps.v20,
            renderCheckbox("기타", 6),
            Spacer(),
            DeButtonLarge(
              "확인",
              onPressed: () async {
                Get.back<List<bool>>(result: isCheckedList);
              },
              enable: isCheckedList.contains(true) ? true : false,
            ),
            DeGaps.v4
          ],
        ),
      ),
    );
  }

  Widget renderCheckbox(String text, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: DeFonts.body16M,
        ),
        CustomCheckbox(
          isChecked: isCheckedList[index],
          onChanged: (newValue) {
            setState(() {
              isCheckedList[index] = newValue;
            });
          },
        ),
      ],
    );
  }
}
