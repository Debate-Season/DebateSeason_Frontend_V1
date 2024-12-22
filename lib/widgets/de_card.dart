import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class DeCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final bool isSelected;

  const DeCard(
    this.text, {
    super.key,
    this.imagePath = '',
    this.imageWidth = 36,
    this.imageHeight = 36,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          imagePath.isEmpty ? Dimensions.vertical40 : Dimensions.vertical20,
      decoration: BoxDecoration(
        color: grey80,
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: brandColor, width: 1) : null,
      ),
      child: Column(
        children: [
          if (imagePath.isNotEmpty) ...[
            Container(
              width: imageWidth,
              height: imageHeight,
              color: brandDark,
            ),
            Gaps.v4,
          ],
          Text(
            text,
            style: body14M,
          ),
        ],
      ),
    );
  }
}
