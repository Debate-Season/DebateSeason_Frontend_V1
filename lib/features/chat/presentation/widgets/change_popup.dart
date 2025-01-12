import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';

class ChangePopup extends StatelessWidget {
  final String popuptitle;
  final String description;
  final String btn1;
  final String btn2;
  final VoidCallback onConfirm;

  const ChangePopup({
    Key? key,
    required this.popuptitle,
    required this.description,
    required this.btn1,
    required this.btn2,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: Dimensions.padding20x16,
        child: Column(
          children: [
            DeText(popuptitle, style: title.copyWith(color: grey10)),
            Gaps.v8,
            DeText(description, style: body14M.copyWith(color: grey30)),
            Gaps.v20,
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
