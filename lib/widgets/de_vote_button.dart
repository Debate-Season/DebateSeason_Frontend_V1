import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/enums/opinion_type.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class DeVoteButton extends StatelessWidget {
  final bool isPros;
  final int agree;
  final int disagree;
  final OpinionType myOpinion;

  const DeVoteButton({
    super.key,
    required this.isPros,
    required this.agree,
    required this.disagree,
    required this.myOpinion,
  });

  getPercentages(int count, int total) {
    double ratio = count / total;

    if (total == 0) ratio = 0;

    return (ratio * 100).toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final widgetColor = isPros
        ? (myOpinion == OpinionType.agree ? DeColors.red : DeColors.redDark)
        : (myOpinion == OpinionType.disagree ? DeColors.blue : DeColors.blueDark);
    final data = isPros ? '찬성' : '반대';

    final agreeRatio = getPercentages(agree, agree + disagree);
    final disagreeRatio = getPercentages(disagree, agree + disagree);

    return Container(
      width: 80,
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 7,
      ),
      decoration: ShapeDecoration(
        color: widgetColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeText(
            data,
            style: DeFonts.caption12M2,
          ),
          DeText(
            data == '찬성' ? '$agreeRatio%' : '$disagreeRatio%',
            style: DeFonts.header20B,
          ),
          DeText(
            data == '찬성' ? '$agree표' : '$disagree표',
            style: DeFonts.caption12M2,
          ),
        ],
      ),
    );
  }
}
