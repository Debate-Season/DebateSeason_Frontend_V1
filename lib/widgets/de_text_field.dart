import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Color? fillColor;
  final String? hintText;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool isCleanIcon;

  const DeTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textAlign,
    this.hintText,
    this.fillColor,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.isCleanIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: decoration ??
            InputDecoration(
              border: InputBorder.none,
              hintStyle: style?.copyWith(color: DeColors.grey50),
              hintText: hintText ?? '내용을 입력해 주세요.',
              contentPadding: Dimensions.all12,
              isDense: true,
              counterText: "",
              filled: true,
              fillColor: fillColor ?? DeColors.grey80,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: DeColors.brandColor, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: isCleanIcon
                  ? (controller.text.isNotEmpty
                      ? DeGestureDetector(
                          onTap: () => controller.clear(),
                          child: Padding(
                            padding: Dimensions.all10,
                            child: SvgPicture.asset(
                                'assets/icons/ic_x_grey50.svg'),
                          ),
                        )
                      : null)
                  : SizedBox.shrink(),
            ),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        autofocus: autofocus,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands,
        maxLength: maxLength,
        // 색상 변경 여부 확인
        cursorColor: DeColors.grey10,
        style: style ?? DeFonts.body14R,
        textAlign: textAlign ?? TextAlign.start,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        onSubmitted: (value) {
          if (onSubmitted != null) {
            onSubmitted!(value);
          }
        },
        inputFormatters: inputFormatters,
        enabled: enabled,
      ),
    );
  }
}
