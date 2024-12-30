import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
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
        padding: Dimensions.vertical12,
        decoration: BoxDecoration(
          color: enable ? brandColor : brandDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DeText(
          text,
          style: body16M.copyWith(color: enable ? grey10 : brandDisable),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
