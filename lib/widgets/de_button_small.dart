import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class DeButtonSmall extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function() onPressed;

  const DeButtonSmall(
    this.text, {
    super.key,
    this.textColor,
    this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DeGestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: DeDimensions.vertical10,
        decoration: BoxDecoration(
          color: backgroundColor ?? DeColors.grey80,
          border: backgroundColor == null
              ? Border.all(
                  width: 1,
                  color: DeColors.grey70,
                )
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DeText(
          text,
          style: DeFonts.body14M.copyWith(color: textColor ?? DeColors.grey10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
