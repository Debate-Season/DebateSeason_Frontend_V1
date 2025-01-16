import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class ProfileInputCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isCommunity;
  final bool isSelected;

  const ProfileInputCard(
    this.text, {
    super.key,
    this.imagePath = '',
    this.isCommunity = false,
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
        border: isSelected
            ? Border.all(color: brandColor, width: 1)
            : isCommunity
                ? Border.all(color: grey70, width: 1)
                : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath.isNotEmpty) ...[
            Container(
              width: isCommunity ? 44 : 36,
              height: isCommunity ? 44 : 36,
              decoration: BoxDecoration(
                color: brandDark,
                borderRadius: BorderRadius.circular(12),
              ),
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
