import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthScreen extends GetView<AuthViewModel> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '대한민국은 지금,',
                    style: body16R,
                  ),
                  Gaps.v4,
                  Text(
                    '토론철',
                    style: largest,
                  ),
                  Gaps.v12,
                  Container(
                    color: white,
                    width: 210,
                    height: 210,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(GetRouterName.authProfile);
                // controller.kakaoLogin();
              },
              child: _widgetLoginBtn(
                loginType: controller.kakaoLoginType,
              ),
            ),
            Gaps.v8,
            GestureDetector(
              onTap: () => controller.appleLogin(),
              child: _widgetLoginBtn(
                loginType: controller.appleLoginType,
              ),
            ),
            Gaps.v16,
          ],
        ),
      ),
    );
  }

  Widget _widgetLoginBtn({
    required String loginType,
  }) {
    const kakaoLogin = '카카오 로그인';
    const appleLogin = '애플 로그인';

    return Container(
      margin: Dimensions.horizontal20,
      padding: Dimensions.vertical12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: loginType == controller.kakaoLoginType ? kakao : white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            loginType == controller.kakaoLoginType
                ? 'assets/icons/ic_kakao_login.svg'
                : 'assets/icons/ic_apple_login.svg',
          ),
          Gaps.h8,
          Text(
            loginType == controller.kakaoLoginType ? kakaoLogin : appleLogin,
            style: body16M.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
