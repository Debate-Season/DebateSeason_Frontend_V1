import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/models/report_reason_selection.dart';
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
  bool isCustomReasonVisible = false;
  late TextEditingController customReasonController = TextEditingController();

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
              "신고 누적 시 해당 대화가 삭제되거나 작성자의 서비스 이용이 "
              "제한됩니다. 신고는 제출 후 수정이 불가하며, 허위 신고 시 "
              "신고자의 서비스 이용이 제한될 수 있으니 주의해 주세요.",
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
            renderCheckboxWithReason("기타", 6),
            Spacer(),
            DeButtonLarge(
              "확인",
              onPressed: () async {
                // 신고 항목 전달.
                Get.back<ReportReasonSelection>(
                    result: ReportReasonSelection(
                        isAbusive: isCheckedList[0],
                        isSexual: isCheckedList[1],
                        isFalseInfo: isCheckedList[2],
                        isSpam: isCheckedList[3],
                        isPromotion: isCheckedList[4],
                        isPrivacyLeak: isCheckedList[5],
                        isEtc: isCheckedList[6],
                        etcDescription: isCheckedList[6]
                            ? customReasonController.text
                            : null));
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

  Widget renderCheckboxWithReason(String text, int index) {
    return Column(
      children: [
        Row(
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
                  isCustomReasonVisible = newValue;
                  isCheckedList[index] = newValue;
                });
              },
            ),
          ],
        ),
        DeGaps.v12,
        if (isCustomReasonVisible)
          SizedBox(
            height: 120,
            child: DeTextField(
              textAlignVertical: TextAlignVertical.top, // 글자 상단 정렬
              controller: customReasonController,
              isCleanIcon: false, // 삭제 버튼 없앰
              expands: true,
              maxLines: null,
            ),
          ),
      ],
    );
  }
}
