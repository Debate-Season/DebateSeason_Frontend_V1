import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/terms_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/web_view_page.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
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
    return Expanded(
      child: Obx(() {
        final agreeItem = controller.termsData;

        return agreeItem.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (agreeItem) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: agreeItem.length,
              itemBuilder: (context, index) {
                final item = agreeItem[index];
                return _termsCheckItem(item);
              },
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
      }),
    );
  }

  Widget _termsCheckItem(TermsEntity terms) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _termsTitle(terms.notionUrl, terms.termsType),
        _termsCheckBox(terms),
      ],
    );
  }

  Widget _termsTitle(String url, String type) {
    String title = ProfileConstants.termsTitleMap[type] ?? '';

    return DeGestureDetector(
      onTap: () {
        Get.to(() => WebViewPage(
              url: url,
              title: title,
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(
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
          DeGaps.h2,
          SvgPicture.asset(
            DeIcons.icArrowRightGrey50,
            width: 16,
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _termsCheckBox(TermsEntity terms) {
    return Obx(() {
      final isChecked = controller.agreeData
          .any((e) => e.termsId == terms.termsId && e.agreed);

      return Checkbox(
        value: isChecked,
        onChanged: (value) {
          controller.checkAgree(terms.termsId, value ?? false);
        },
      );
    });
  }

  Widget _agreeButton() {
    return Obx(() {
      return controller.termsData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (agreeItem) {
          final enabled = agreeItem.every((term) => controller.agreeData
              .any((e) => e.termsId == term.termsId && e.agreed));

          return DeButtonLarge(
            '동의하고 넘어가기',
            onPressed: enabled ? () => controller.postTermsAgree() : () => (),
            enable: enabled,
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
    });
  }
}
