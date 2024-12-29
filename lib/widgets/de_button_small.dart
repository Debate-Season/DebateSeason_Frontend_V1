import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class DeButtonSmall extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;

  const DeButtonSmall(
    this.text, {
    super.key,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return DeGestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: Dimensions.vertical10,
        decoration: BoxDecoration(
          color: backgroundColor ?? grey80,
          border: backgroundColor == null
              ? Border.all(
                  width: 1,
                  color: grey70,
                )
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DeText(
          text,
          style: body14M,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
