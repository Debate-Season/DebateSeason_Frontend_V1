import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/request/terms_agree_req.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_agree_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/terms_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/web_view_page.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TermsPage extends GetView<TermsViewModel> {
  const TermsPage({super.key});

// class TermsPageState extends State<TermsPage> {
//   bool _isCheckedTermsOfUse = false;
//   bool _isCheckedPrivacyPolicy = false;

  @override
  Widget build(BuildContext context) {
    log.d("🟢 [View] TermsViewModel 인스턴스 확인: ${controller.hashCode}");
    final testEntities = [
      TermsAgreeEntity(termsId: 1, agreed: true),
      TermsAgreeEntity(termsId: 2, agreed: false),
    ];

    // ✅ Entity → Request Model 변환
    final termsAgreeReq = TermsAgreeReq.fromEntityList(testEntities);

    // ✅ JSON 변환 결과 확인
    log.d("🟢 [테스트] TermsAgreeReq JSON 변환 결과: ${termsAgreeReq.toJson()}");
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: DeText(
        '이용 동의',
        style: DeFonts.header,
      ),
      isBack: false,
    );
  }

  Widget _body() {
    return Padding(
      padding: DeDimensions.padding20x12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeText(
            '서비스 이용을 위해\n약관 동의가 필요합니다.',
            style: DeFonts.header,
          ),
          DeGaps.v28,
          DeText(
            '이용 약관',
            style: DeFonts.header,
          ),
          DeGaps.v12,
          _agreeTerms(),
          _agreeButton(),
        ],
      ),
    );
  }

  Widget _agreeTerms() {
    return Obx(
      () {
        final agreeItem = controller.termsData;

        return agreeItem.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (agreeItem) {
            return Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: agreeItem.length,
                itemBuilder: (context, index) {
                  final item = agreeItem[index];
                  //return _widgetPolicyTerms(item.notionUrl, item.termsType, item.termsId);
                  return _widgetPolicyTerms(item);
                },
                separatorBuilder: (context, index) => DeGaps.v12,
              ),
            );
          },
          failure: (error) => SizedBox(
            height: 36,
            child: Center(
              child: DeText(
                '데이터 로딩 실패',
                style: DeFonts.body16M.copyWith(color: DeColors.grey10),
              ),
            ),
          ),
        );
      },
    );
  }

//    //type이 SERVICE이면 서비스 이용약관, type이 PRIVACY이면 개인정보 처리방침
  Widget _widgetPolicyTerms(TermsEntity terms) {
    String title = '';
    if (terms.termsType == 'SERVICE') {
      title = '서비스 이용 약관';
    } else if (terms.termsType == 'PRIVACY') {
      title = '개인정보 수집/이용 동의';
    }

    return DeGestureDetector(
      onTap: () {
        Get.to(() => WebViewPage(
              url: terms.notionUrl,
              title: title,
            ));
      },
      child: _webView(terms, title),
    );
  }

  Widget _webView(TermsEntity terms, String title) {
    return Obx(() {
      final isChecked = controller.agreeData
          .any((e) => e.termsId == terms.termsId && e.agreed);

      return CheckboxListTile(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '(필수)',
                style: DeFonts.body16M.copyWith(color: DeColors.brandColor),
              ),
              TextSpan(
                text: ' $title',
                style: DeFonts.body16M.copyWith(color: DeColors.grey10),
              ),
            ],
          ),
        ),
        value: isChecked,
        onChanged: (value) {
          controller.checkAgree(terms.termsId, value ?? false);
        },
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      );
    });
  }

  Widget _agreeButton() {
    log.d("🟢 [View] postTermsAgree 함수: ${controller.postTermsAgree}");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DeButtonLarge(
        '동의하고 넘어가기',
        onPressed: () async {
          log.d('눌렸니?');
          await controller.postTermsAgree();
        },
      ),
    );
  }

// Widget _webView(String title) {
//   return Row(
//     children: [
//       Text.rich(
//         TextSpan(
//           children: [
//             TextSpan(
//               text: '(필수)',
//               style: DeFonts.body16M.copyWith(color: DeColors.brandColor),
//             ),
//             TextSpan(
//               text: ' $title',
//               style: DeFonts.body16M.copyWith(color: DeColors.grey10),
//             ),
//           ],
//         ),
//       ),
//       DeGaps.h2,
//       SvgPicture.asset(
//         DeIcons.icArrowRightGrey50,
//         width: 16.0,
//         height: 16.0,
//       ),
//     ],
//   );
// }
/*
Widget _body() {
  bool isCheckedTermsOfUse = false;
  bool isCheckedPrivacyPolicy = false;

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _terms(),
      SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeGaps.v40,
            DeText(
              '서비스 이용을 위해\n약관 동의가 필요합니다.',
              style: DeFonts.header,
            ),
            DeGaps.v28,
            DeText(
              '약관 및 개인정보 처리방침',
              style: DeFonts.header,
            ),
            DeGaps.v12,
            _widgetPolicyTerms(
              'https://hurricane-ticket-d3c.notion.site/18d034a172448095aa0ecc41849e9508',
              '서비스 이용 약관',
              isCheckedTermsOfUse,
              // (bool newValue) {
              //   setState(() {
              //     isCheckedTermsOfUse = newValue;
              //   });
              // },
            ),
            DeGaps.v20,
            _widgetPolicyTerms(
              'https://hurricane-ticket-d3c.notion.site/1a9034a1724480dba1c3d5a0ce6b696e',
              '개인정보 수집/이용 동의',
              isCheckedPrivacyPolicy,
              // (bool newValue) {
              //   setState(() {
              //     isCheckedPrivacyPolicy = newValue;
              //   });
              // },
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DeButtonLarge(
          '동의하고 넘어가기',
          onPressed: () {
            if (!isCheckedTermsOfUse || !isCheckedPrivacyPolicy) {
              return;
            }
            Get.toNamed(
              GetRouterName.profileInput,
            );
          },
          enable: isCheckedTermsOfUse && isCheckedPrivacyPolicy,
        ),
      )
    ],
  );
}

Widget _terms() {
  return Obx(() => DeText(
        controller.termsData.when(
          loading: () => '로딩중',
          success: (termsData) => termsData.termsType,
          failure: (error) => error,
        ),
        style: DeFonts.body16M,
      ));
}

Widget _widgetPolicyTerms(String url, String title, bool isChecked) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DeGestureDetector(
        onTap: () {
          Get.to(() => WebViewPage(
                url: url,
                title: title,
              ));
        },
        child: _webView(title),
      ),
      // _checkBox(
      //   checked: isChecked,
      //   onChanged: onChanged,
      // ),
    ],
  );
}

Widget _webView(String title) {
  return Row(
    children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '(필수)',
              style: DeFonts.body16M.copyWith(color: DeColors.brandColor),
            ),
            TextSpan(
              text: ' $title',
              style: DeFonts.body16M.copyWith(color: DeColors.grey10),
            ),
          ],
        ),
      ),
      DeGaps.h2,
      SvgPicture.asset(
        DeIcons.icArrowRightGrey50,
        width: 16.0,
        height: 16.0,
      ),
    ],
  );
}

Widget _checkBox({
  required bool checked,
  required ValueChanged<bool> onChanged,
}) {
  return SizedBox(
    width: 24.0,
    height: 24.0,
    child: Checkbox(
      value: checked,
      onChanged: (bool? value) {
        if (value != null) {
          onChanged(value);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      side: BorderSide(
        width: 1,
        color: DeColors.grey80,
      ),
      activeColor: DeColors.brandColor,
      checkColor: DeColors.grey10,
    ),
  );
}

 */
}
