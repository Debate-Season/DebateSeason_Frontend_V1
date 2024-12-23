import 'package:flutter/material.dart';

class DeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextScaler? textScaler;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const DeText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.textScaler,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textScaler: textScaler ?? TextScaler.noScaling,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
