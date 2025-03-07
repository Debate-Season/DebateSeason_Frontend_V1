import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/web_view_page.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePolicyPage extends StatefulWidget {
  const ProfilePolicyPage({super.key});

  @override
  ProfilePolicyPageState createState() => ProfilePolicyPageState();
}

class ProfilePolicyPageState extends State<ProfilePolicyPage> {
  bool _isCheckedTermsOfUse = false;
  bool _isCheckedPrivacyPolicy = false;

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
        style: DeFonts.header,
      ),
      isBack: false,
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
                _isCheckedTermsOfUse,
                (bool newValue) {
                  setState(() {
                    _isCheckedTermsOfUse = newValue;
                  });
                },
              ),
              DeGaps.v20,
              _widgetPolicyTerms(
                'https://hurricane-ticket-d3c.notion.site/1a9034a1724480dba1c3d5a0ce6b696e',
                '개인정보 수집/이용 동의',
                _isCheckedPrivacyPolicy,
                (bool newValue) {
                  setState(() {
                    _isCheckedPrivacyPolicy = newValue;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DeButtonLarge(
            '동의하고 넘어가기',
            onPressed: () {
              if (!_isCheckedTermsOfUse || !_isCheckedPrivacyPolicy) {
                return;
              }
              Get.toNamed(
                GetRouterName.profileInput,
              );
            },
            enable: _isCheckedTermsOfUse && _isCheckedPrivacyPolicy,
          ),
        )
      ],
    );
  }

  Widget _widgetPolicyTerms(
      String url, String title, bool isChecked, ValueChanged<bool> onChanged) {
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
        _checkBox(
          checked: isChecked,
          onChanged: onChanged,
        ),
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
}
