import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
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
      padding: DeDimensions.vertical40,
      decoration: BoxDecoration(
        color: DeColors.grey80,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: DeColors.brandColor, width: 1)
            : Border.all(color: DeColors.grey70, width: 1),
      ),
      child: Center(
        child: Text(
          text,
          style: DeFonts.body14M,
        ),
      ),
    );
  }
}
