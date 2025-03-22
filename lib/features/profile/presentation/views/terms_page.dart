import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/terms_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/web_view_page.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TermsPage extends GetView<TermsViewModel> {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: DeText(
        '이용 동의',
        style: DeFonts.header20B,
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
            style: DeFonts.header24B,
          ),
          DeGaps.v28,
          DeText(
            '이용 약관',
            style: DeFonts.header18Sb.copyWith(color: DeColors.grey30),
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
                  return _termsCheckItem(item);
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

  Widget _termsCheckItem(TermsEntity terms) {
    String title = '';
    //type이 SERVICE이면 서비스 이용약관, type이 PRIVACY이면 개인정보 처리방침
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
                style: DeFonts.body16M.copyWith(color: DeColors.brand),
              ),
              TextSpan(
                text: ' $title',
                style: DeFonts.body16M.copyWith(color: DeColors.grey10),
              ),
            ],
          ),
        ),
        value: isChecked,
        contentPadding: EdgeInsets.zero,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DeButtonLarge(
        '동의하고 넘어가기',
        onPressed: () async {
          await controller.postTermsAgree();
        },
      ),
    );
  }
}
