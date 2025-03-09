import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileGenderCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isSelected;

  const ProfileGenderCard(
    this.text, {
    super.key,
    required this.imagePath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DeDimensions.vertical28,
      decoration: BoxDecoration(
        color: DeColors.grey80,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: DeColors.brand, width: 1)
            : Border.all(color: DeColors.grey70, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              imagePath,
              width: 12,
              height: 20,
            ),
          ),
          DeGaps.v4,
          Text(
            text,
            style: DeFonts.body14M,
          ),
        ],
      ),
    );
  }
}
