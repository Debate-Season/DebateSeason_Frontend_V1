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
    return ListView(
      children: [
        DeGaps.v4, //todo 여백값 정확히 계산
        _mainMedia(),
        DeGaps.v40,
        _medias(),
      ],
    );
  }

  Widget _mainMedia() {
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
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DeGestureDetector(
                      onTap: () {},
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
                      DeIcons.icMoreGrey50,
                    ),
                  ),
                ],
              ),
              DeGaps.v4,
              Row(
                children: [
                  DeText('경향신문',
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey50)),
                  DeGaps.h6,
                  SvgPicture.asset(
                    DeIcons.icDotGrey50,
                  ),
                  DeGaps.h6,
                  DeText('13:23',
                      style:
                          DeFonts.caption12M.copyWith(color: DeColors.grey50)),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _medias() {
    return Padding(
      padding: DeDimensions.padding20x12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeText(
            '모아보기',
            style: DeFonts.header18Sb.copyWith(color: DeColors.grey10),
          ),
          DeGaps.v16,
          _mediaCategory(),
          DeGaps.v20,
          _mediaList(),
        ],
      ),
    );
  }

  Widget _mediaCategory() {
    Widget categoryBtn(String title) {
      return DeGestureDetector(
        onTap: () {},
        child: Container(
          padding: DeDimensions.padding10x4,
          decoration: BoxDecoration(
            color: DeColors.grey10,
            borderRadius: BorderRadius.circular(6),
          ),
          child: DeText(
            title,
            style: DeFonts.body14Sb.copyWith(color: DeColors.grey120),
          ),
        ),
      );
    }

    return Row(
      children: [
        categoryBtn('모두'),
        DeGaps.h12,
        categoryBtn('뉴스 · 기사'),
        DeGaps.h12,
        categoryBtn('Youtube'),
        DeGaps.h12,
        categoryBtn('커뮤니티'),
        DeGaps.h12,
      ],
    );
  }

  Widget _mediaListItems() {
    return Column(
      children: [
        Row(
          children: [
            DeGestureDetector(
              onTap: () {},
              child: Container(
                width: 160,
                height: 100,
                color: DeColors.grey110,
              ),
            ),
            DeGaps.h12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeGestureDetector(
                    onTap: () {},
                    child: DeText(
                      '대한민국 헌법상 계엄령 조항은 시대에 맞게 개정될 필요가 있는가?',
                      style: DeFonts.body16M.copyWith(color: DeColors.grey10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DeGaps.v4,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
