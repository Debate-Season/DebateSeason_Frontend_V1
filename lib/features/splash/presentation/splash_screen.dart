import 'dart:io';

import 'package:debateseason_frontend_v1/common/constants/error_constants.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_entity.dart';
import 'package:debateseason_frontend_v1/features/splash/presentation/splash_view_model.dart';
import 'package:debateseason_frontend_v1/features/splash/splash_constants.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends GetView<SplashViewModel> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ever(controller.appVersion, (appVersion) {
      if (appVersion != null) {
        _appUpdateDeDialog(appVersion: appVersion);
      }
    });
    ever(controller.nextRoute, (routeName) {
      if (routeName.isNotEmpty) {
        if (routeName == GetRouterName.terms) {
          Get.offAllNamed(routeName, arguments: controller.profileStatus);
        } else {
          Get.offAllNamed(routeName);
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.gif',
          width: 80,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future<void> _appUpdateDeDialog({required AppVersionEntity appVersion}) {
    return DeDialog.show(
      barrierDismissible: false,
      dialogTitle: SplashConstants.UPDATE,
      dialogText: SplashConstants.UPDATE_DIALOG_CONTENT,
      cancelText: SplashConstants.UPDATE_AFTER,
      doneText: SplashConstants.UPDATE,
      onTapCancel: () {
        if (appVersion.forceUpdate) {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          } else {
            Get.back();
          }
        } else {
          controller.determineNextRoute();
        }
      },
      onTapDone: () async {
        if (Platform.isAndroid) {
          if (await canLaunchUrl(Uri.parse(SplashConstants.PLAY_STORE_URL))) {
            await launchUrl(Uri.parse(SplashConstants.PLAY_STORE_URL));
          }
        } else if (Platform.isIOS) {
          if (await canLaunchUrl(Uri.parse(SplashConstants.APP_STORE_URL))) {
            await launchUrl(Uri.parse(SplashConstants.APP_STORE_URL),
                mode: LaunchMode.externalApplication);
          }
        } else {
          deSnackBar(ErrorConstants.UNSUPPORTED_OS);
        }
      },
    );
  }
}
