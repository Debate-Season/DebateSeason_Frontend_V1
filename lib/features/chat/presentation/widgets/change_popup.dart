import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class ChangePopup extends StatelessWidget {
  final String popupTitle;
  final String description;
  final String btn1;
  final String btn2;
  final VoidCallback onConfirm;

  const ChangePopup({
    super.key,
    required this.popupTitle,
    required this.description,
    required this.btn1,
    required this.btn2,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: DeDimensions.padding20x16,
        child: Column(
          children: [
            DeText(popupTitle,
                style: DeFonts.title.copyWith(color: DeColors.grey10)),
            DeGaps.v8,
            DeText(description,
                style: DeFonts.body14M.copyWith(color: DeColors.grey30)),
            DeGaps.v20,
            Row(
              children: [
                TextButton(onPressed: () => {log.d('btn1')}, child: Text(btn1)),
                ElevatedButton(
                  onPressed: onConfirm,
                  child: Text(btn2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
