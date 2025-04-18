import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked); // 값 변경
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isChecked ? DeColors.brand : DeColors.grey110,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: DeColors.grey80, width: 1),
        ),
        child:
            isChecked ? Icon(Icons.check, color: Colors.white, size: 18) : null,
      ),
    );
  }
}
