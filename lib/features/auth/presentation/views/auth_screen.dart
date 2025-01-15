import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/auth_constants.dart';
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
                controller.loginWithKakao().then((uiState) {
                  uiState.when(
                      loading: () {},
                      success: (data) {
                        if (data.profileStatus) {
                          Get.toNamed(GetRouterName.home);
                        } else {
                          Get.toNamed(GetRouterName.profileInput);
                        }
                      },
                      failure: (msg) {
                        Get.snackbar('로그인 실패', msg);
                      });
                });
              },
              child: _widgetLoginBtn(
                loginType: AuthConstants.kakaoLoginType,
              ),
            ),
            Gaps.v8,
            GestureDetector(
              onTap: () {
                controller.loginWithApple().then((uiState) {
                  uiState.when(
                      loading: () {},
                      success: (data) {
                        if (data.profileStatus) {
                          // todo 메인 홈으로 이동
                          Get.toNamed(GetRouterName.profileInput);
                        } else {
                          Get.toNamed(GetRouterName.profileInput);
                        }
                      },
                      failure: (msg) {
                        Get.snackbar('로그인 실패', msg);
                      });
                });
              },
              child: _widgetLoginBtn(
                loginType: AuthConstants.appleLoginType,
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
    return Container(
      margin: Dimensions.horizontal20,
      padding: Dimensions.vertical12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: loginType == AuthConstants.kakaoLoginType ? kakao : white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            loginType == AuthConstants.kakaoLoginType
                ? 'assets/icons/ic_kakao_login.svg'
                : 'assets/icons/ic_apple_login.svg',
          ),
          Gaps.h8,
          Text(
            loginType == AuthConstants.kakaoLoginType
                ? AuthConstants.kakaoLogin
                : AuthConstants.appleLogin,
            style: body16M.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
