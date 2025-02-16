import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';

class ProfileCommunityCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isSelected;

  const ProfileCommunityCard(
    this.text, {
    super.key,
    required this.imagePath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.vertical16,
      decoration: BoxDecoration(
        color: DeColors.grey80,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: DeColors.brandColor, width: 1)
            : Border.all(color: DeColors.grey70, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: DeCachedImage(
              imagePath,
              width: 44,
              height: 44,
            ),
          ),
          Gaps.v4,
          Text(
            text,
            style: DeFonts.body14M,
          ),
        ],
      ),
    );
  }
}
