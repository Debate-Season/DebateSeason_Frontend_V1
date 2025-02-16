import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_small.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeDialog {
  static Future<void> show({
    required String dialogTitle,
    String dialogText = '',
    required String cancelText,
    required String doneText,
    required VoidCallback onTapDone,
  }) {
    return Get.dialog(
      Dialog(
        backgroundColor: DeColors.grey80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DeText(dialogTitle, style: DeFonts.title),
              if (dialogText.isNotEmpty) ...[
                Gaps.v8,
                DeText(
                  dialogText,
                  style: DeFonts.body14M.copyWith(color: DeColors.grey30),
                  textAlign: TextAlign.center,
                ),
              ],
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DeButtonSmall(
                      cancelText,
                      onPressed: () {
                        Get.back();
                      },
                      textColor: DeColors.red,
                    ),
                  ),
                  Gaps.h8,
                  Expanded(
                    child: DeButtonSmall(
                      doneText,
                      textColor: DeColors.brandColor,
                      onPressed: () {
                        onTapDone();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
