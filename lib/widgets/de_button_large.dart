import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class DeButtonLarge extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool enable;

  const DeButtonLarge(
    this.text, {
    super.key,
    required this.onPressed,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return DeGestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: DeDimensions.vertical12,
        decoration: BoxDecoration(
          color: enable ? DeColors.brandColor : DeColors.brandDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DeText(
          text,
          style: DeFonts.body16M.copyWith(color: enable ? DeColors.grey10 : DeColors.brandDisable),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
