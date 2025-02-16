import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void deSnackBar(String message) {
  Get.snackbar(
    "",
    "",
    snackPosition: SnackPosition.TOP,
    backgroundColor: DeColors.brandColor,
    colorText: DeColors.grey10,
    duration: Duration(seconds: 2),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOut,
    titleText: Container(),
    messageText: Text(
      message,
      style: DeFonts.body14M.copyWith(color: DeColors.grey10),
      textAlign: TextAlign.center,
    ),
    margin: EdgeInsets.zero,
    padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
  );
}
