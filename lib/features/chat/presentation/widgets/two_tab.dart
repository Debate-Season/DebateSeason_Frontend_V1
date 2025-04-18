import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';

class TwoTab extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int index) onChange;

  const TwoTab({
    super.key,
    required this.labels,
    this.selectedIndex = 0,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onChange(0),
            child: selectedIndex == 0
                ? _SelectedTab(labels[0])
                : _UnSelected(labels[0]),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onChange(1),
            child: selectedIndex == 1
                ? _SelectedTab(labels[1])
                : _UnSelected(labels[1]),
          ),
        ),
      ],
    );
  }
}

class _SelectedTab extends StatelessWidget {
  final String text;
  const _SelectedTab(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: DeColors.grey10, width: 2))),
      child: Center(child: DeText(text, style: DeFonts.body14Sb)),
    );
  }
}

class _UnSelected extends StatelessWidget {
  final String text;
  const _UnSelected(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: Center(child: DeText(text, style: DeFonts.body14Sb)),
    );
  }
}
