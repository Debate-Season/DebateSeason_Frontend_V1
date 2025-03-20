import 'dart:io';

import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/auth_constants.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/exit_app_util.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthScreen extends GetView<AuthViewModel> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        ExitAppUtil.onWillPop();
      },
      child: DeScaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/img_auth_logo.png',
              width: 160,
              height: 160,
            ),
          ),
          if (Platform.isAndroid)
            GestureDetector(
              onTap: () {
                controller.loginWithKakao().then((uiState) {
                  uiState.when(
                    loading: () {
                      log.d('로딩중...');
                    },
                    success: (profileStatus) {
                      if (profileStatus) {
                        Get.offNamed(GetRouterName.issuemap);
                      } else {
                        Get.offNamed(GetRouterName.terms);
                      }
                    },
                    failure: (msg) {
                      deSnackBar(msg);
                    },
                  );
                });
              },
              child: _widgetLoginBtn(
                loginType: AuthConstants.kakaoLoginType,
              ),
            ),
          if (Platform.isIOS)
            GestureDetector(
              onTap: () {
                controller.loginWithApple().then((uiState) {
                  uiState.when(
                    loading: () {
                      log.d('로딩중...');
                    },
                    success: (profileStatus) {
                      if (profileStatus) {
                        Get.offNamed(GetRouterName.issuemap);
                      } else {
                        Get.offNamed(GetRouterName.terms);
                      }
                    },
                    failure: (msg) {
                      deSnackBar(msg);
                    },
                  );
                });
              },
              child: _widgetLoginBtn(
                loginType: AuthConstants.appleLoginType,
              ),
            ),
          DeGaps.v16,
        ],
      ),
    );
  }

  Widget _widgetLoginBtn({
    required String loginType,
  }) {
    return Container(
      margin: DeDimensions.horizontal20,
      padding: DeDimensions.vertical12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: loginType == AuthConstants.kakaoLoginType
            ? DeColors.kakao
            : DeColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            loginType == AuthConstants.kakaoLoginType
                ? DeIcons.icKakaoLogin
                : DeIcons.icAppleLogin,
          ),
          DeGaps.h8,
          Text(
            loginType == AuthConstants.kakaoLoginType
                ? AuthConstants.kakaoLogin
                : AuthConstants.appleLogin,
            style: DeFonts.body16M.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
