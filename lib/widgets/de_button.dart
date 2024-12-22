import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class DeButton extends StatelessWidget {
  final String text;
  final bool enable;

  const DeButton(this.text, {super.key, required this.enable});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Dimensions.vertical12,
      decoration: BoxDecoration(
        color: enable ? brandColor : brandTrans80,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DeText(
        text,
        style: body16M.copyWith(color: enable ? grey10 : brandDisable),
        textAlign: TextAlign.center,
      ),
    );
  }
}
