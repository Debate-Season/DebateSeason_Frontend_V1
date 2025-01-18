import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class ProfileTextCard extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ProfileTextCard(
    this.text, {
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.vertical40,
      decoration: BoxDecoration(
        color: grey80,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: brandColor, width: 1)
            : Border.all(color: grey70, width: 1),
      ),
      child: Center(
        child: Text(
          text,
          style: body14M,
        ),
      ),
    );
  }
}
