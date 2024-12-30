import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_small.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeDialog {
  final String text;
  final String doneText;
  final void Function() onTapDone;

  DeDialog(
    this.text, {
    required this.doneText,
    required this.onTapDone,
  }) {
    _showLogoutDialog();
  }

  void _showLogoutDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: grey80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DeText(
                text,
                style: title,
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DeButtonSmall(
                      '취소',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Gaps.h8,
                  Expanded(
                    child: DeButtonSmall(
                      doneText,
                      onPressed: onTapDone,
                      backgroundColor: brandColor,
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
