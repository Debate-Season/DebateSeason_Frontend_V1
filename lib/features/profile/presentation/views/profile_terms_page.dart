import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/web_view_page.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class ProfileTermsPage extends GetView<ProfileViewModel>{
  const ProfileTermsPage({super.key});

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
        '약관 및 개인정보 처리 동의',
        style: DeFonts.header20B,
      ),
      isBack: true,
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          _myTerms(),
        ],
      ),
    );
  }

  Widget _myTerms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeText(
          '필수 동의 내용',
          style: DeFonts.header18Sb,
        ),
        DeGaps.v6,
        _termsItem(
          termsType: 'SERVICE',
          label: '서비스 이용약관 동의',
          url:
          'https://hurricane-ticket-d3c.notion.site/18d034a172448095aa0ecc41849e9508',
        ),
        _termsItem(
          termsType: 'PRIVACY',
          label: '개인정보 수집/이용 동의',
          url:
          'https://hurricane-ticket-d3c.notion.site/24f034a172448015bcc9dc08af777c3e',
        ),
        _termsItem(
          termsType: 'THIRD_PARTY',
          label: '개인정보 제3자 제공 동의',
          url:
          'http://hurricane-ticket-d3c.notion.site/3-24f034a1724480848cbfe32283e0ea95',
        ),
      ],
    );
  }

  Widget _termsItem({
    required String termsType,
    required String label,
    required String url,
  }) {
    return DeGestureDetector(
      onTap: () {
        Get.to(() => WebViewPage(url: url, title: label));
      },
      child: Padding(
        padding: DeDimensions.vertical12,
        child: Row(
          children: [
            DeText(
              label,
              style: DeFonts.body16M.copyWith(
                color: DeColors.grey30,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Obx(() {
              final myTerms = controller.myTermsData;

              return myTerms.when(
                loading: () => const SizedBox(
                  width: 60,
                  child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                success: (data) {
                  final matches = data.where((e) => e.termsType == termsType);
                  final agreedAt =
                  matches.isEmpty ? null : matches.first.agreedAt;

                  final text =
                  (agreedAt is String && agreedAt.trim().isNotEmpty)
                      ? agreedAt
                      : '';

                  return DeText(
                    text,
                    style: DeFonts.body14M.copyWith(color: DeColors.grey50),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
                failure: (error) => DeText(
                  '오류',
                  style: DeFonts.body14M.copyWith(color: DeColors.red),
                ),
              );
            }),
            DeGaps.h8,
            SvgPicture.asset(DeIcons.icArrowRightGrey50),
          ],
        ),
      ),
    );
  }
}