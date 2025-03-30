import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';

class DebateWikiWidget extends StatelessWidget {
  final int agreeTotal;
  final int agreeLogic;
  final int agreeAttitude;
  final String agreeMvp;
  final int disagreeTotal;
  final int disagreeLogic;
  final int disagreeAttitude;
  final String disagreeMvp;

  const DebateWikiWidget(
      {super.key,
      required this.agreeTotal,
      required this.agreeLogic,
      required this.agreeAttitude,
      required this.agreeMvp,
      required this.disagreeTotal,
      required this.disagreeLogic,
      required this.disagreeAttitude,
      required this.disagreeMvp});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TOTAL
        Container(
          height: 96,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: DeColors.grey110,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: buildColumn(
                  align: Alignment.centerRight,
                  total: agreeTotal,
                  logic: agreeLogic,
                  attitude: agreeAttitude,
                  color: Colors.purpleAccent,
                  dotColor: Colors.red,
                ),
              ),
              Expanded(child: buildCenterColumn()),
              Expanded(
                child: buildColumn(
                  align: Alignment.centerLeft,
                  total: disagreeTotal,
                  logic: disagreeLogic,
                  attitude: disagreeAttitude,
                  color: Colors.purpleAccent,
                  dotColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        DeGaps.v4,
        // MVP
        Container(
          height: 37,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: DeColors.grey110,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DeText(agreeMvp, style: DeFonts.body14M),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DeText("MVP",
                      style:
                          DeFonts.caption12SB.copyWith(color: DeColors.grey50)),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DeText(disagreeMvp, style: DeFonts.body14M),
                ],
              )),
            ],
          ),
        ),
        DeGaps.v40,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 2,
                color: DeColors.grey90,
              ),
            ),
            DeText("토론 요약",
                style: DeFonts.body14Sb.copyWith(color: DeColors.grey50)),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 2,
                color: DeColors.grey90,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildColumn({
    required Alignment align,
    required int total,
    required int logic,
    required int attitude,
    required Color color,
    required Color? dotColor,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: align == Alignment.centerRight
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (align == Alignment.centerRight) buildDot(dotColor),
            Text(total.toString(),
                style: DeFonts.body16Sb.copyWith(color: DeColors.brand)),
            if (align == Alignment.centerLeft) buildDot(dotColor),
          ],
        ),
        Text(logic.toString(),
            style: DeFonts.body16Sb.copyWith(color: DeColors.grey10)),
        Text(attitude.toString(),
            style: DeFonts.body16Sb.copyWith(color: DeColors.grey10)),
      ],
    );
  }

  Widget buildCenterColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("합계", style: DeFonts.caption12SB.copyWith(color: DeColors.grey50)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("논리",
                style: DeFonts.caption12SB.copyWith(color: DeColors.grey50)),
            Center(
              child: Image.asset(
                'assets/images/logic.png',
                height: 16,
                width: 16,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("태도",
                style: DeFonts.caption12SB.copyWith(color: DeColors.grey50)),
            Center(
                child: Image.asset(
              'assets/images/attitude.png',
              height: 16,
              width: 16,
            )),
          ],
        ),
      ],
    );
  }

  Widget buildDot(Color? color) {
    if (color == null) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
