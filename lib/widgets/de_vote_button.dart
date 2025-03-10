import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';

class DeVoteButton extends StatelessWidget {
  final bool isPros;
  final int agree;
  final int disagree;
  final String myOpinion;

  const DeVoteButton({
    super.key,
    required this.isPros,
    required this.agree,
    required this.disagree,
    required this.myOpinion,
  });

  getPercentages(int agree, int disagree) {
    int total = agree + disagree;
    double agreeRatio = agree / total;
    double disagreeRatio = disagree / total;

    if (total == 0) {
      agreeRatio = 0;
      disagreeRatio = 0;
    }
    String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
    String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

    return [agreeRatioText, disagreeRatioText];
  }

  @override
  Widget build(BuildContext context) {
    final widgetColor = isPros
        ? (myOpinion == 'AGREE' ? DeColors.red : DeColors.redDark)
        : (myOpinion == 'DISAGREE' ? DeColors.blue : DeColors.blueDark);
    final data = isPros ? '찬성' : '반대';

    final percentages = getPercentages(agree, disagree);
    final agreeRatioText = percentages[0];
    final disagreeRatioText = percentages[1];

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
            data == '찬성' ? '$agreeRatioText%' : '$disagreeRatioText%',
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
