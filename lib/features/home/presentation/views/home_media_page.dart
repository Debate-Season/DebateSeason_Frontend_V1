import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMediaPage extends StatelessWidget {
  const HomeMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(children: [
      _mainMedia(),
      _mediaList(),
    ]);
  }

  Widget _mainMedia() {
    //padding을 이렇게 따로둬도 되나
      return Column(
      children: [
        DeGestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 180,
            color: DeColors.brand,
          ),
        ),
        Padding(
          padding: DeDimensions.padding20x12,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DeGestureDetector(
                      onTap: (){},
                      child: DeText(
                        '[단독]노원구 마약류 양귀비 텃밭, 초등학구 마약류 양귀비 텃',
                        style: DeFonts.body16M.copyWith(color: DeColors.grey10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DeGaps.h12,
                  DeGestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      width: 20,
                      height: 20,
                      DeIcons.icMoreGrey10,
                    ),
                  ),
                ],
              ),
              DeGaps.v4,
              Row(
                children: [
                  DeText('경향신문',
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey10)),
                  DeText(' . ',
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey10)),
                  DeText('13:23',
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey10)),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _mediaList() {
    return Padding(
      padding: DeDimensions.padding20x12,
      child: Column(),
    );
  }
}
