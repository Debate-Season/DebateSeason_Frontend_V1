import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_small.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeDialogWithSingleButton {
  static Future<void> show({
    bool barrierDismissible = true,
    required String dialogTitle,
    required List<String> dialogTexts,
    required doneText,
    VoidCallback? onTapCancel,
    required VoidCallback onTapDone,
  }) {
    return Get.dialog(
      barrierDismissible: barrierDismissible,
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
              DeText(dialogTitle, style: DeFonts.header18Sb),
              DeGaps.v12,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: dialogTexts
                      .map(
                        (text) => Column(children: [
                          DeText(
                            text,
                            style: DeFonts.body14M
                                .copyWith(color: DeColors.grey30),
                            textAlign: TextAlign.left,
                          ),
                          DeGaps.v4,
                        ]),
                      )
                      .toList(),
                ),
              ),
              DeGaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DeButtonSmall(
                      doneText,
                      textColor: DeColors.brand,
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
