import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:flutter/material.dart';

class ReactionPicker extends StatelessWidget {
  final Function(String) onReactionSelect;
  final void Function() onInappropriateChatReport;

  const ReactionPicker({
    super.key,
    required this.onReactionSelect,
    required this.onInappropriateChatReport,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169,
      child: Column(
        children: [
          // 리액션
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: DeColors.grey70,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IntrinsicHeight(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(
                  'assets/images/logic_minus.png',
                  width: 24,
                  height: 24,
                ),
                DeGaps.h12,
                Image.asset(
                  'assets/images/logic_plus.png',
                  width: 24,
                  height: 24,
                ),
                VerticalDivider(
                  color: DeColors.grey50,
                  width: 25,
                  thickness: 1,
                  indent: 6,
                  endIndent: 6,
                ),
                Image.asset(
                  'assets/images/attitude_minus.png',
                  width: 24,
                  height: 24,
                ),
                DeGaps.h12,
                Image.asset(
                  'assets/images/attitude_plus.png',
                  width: 24,
                  height: 24,
                ),
              ]),
            ),
          ),
          DeGaps.v4,
          // 신고
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: DeColors.grey70,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onInappropriateChatReport,
                  child: Text(
                    "신고",
                    style: DeFonts.caption12R,
                  ),
                ),
                Image.asset(
                  'assets/images/flag.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
