import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/media_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_bottom_sheet_notitle.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeMediaPage extends GetView<MediaViewModel> {
  const HomeMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      children: [
        DeGaps.v4, //todo 여백값 정확히 계산
        _mainMedia(context),
        DeGaps.v40,
        _medias(),
      ],
    );
  }

  Widget _mainMedia(BuildContext context) {
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
                    onTap: () {
                      showModalBottomSheet(
                        context: context, //todo context 넣은 부모위젯들 삭제
                        builder: (context) {
                          return DeBottomSheetNoTitle(
                            widget: Column(
                              children: [
                                DeGestureDetector(
                                  onTap: () {},
                                  child: (Row(
                                    children: [
                                      SvgPicture.asset(
                                        DeIcons.icCopyGrey10,
                                      ),
                                      DeGaps.h16,
                                      DeText('URL 복사하기',
                                          style: DeFonts.body16M
                                              .copyWith(color: DeColors.grey10)),
                                    ],
                                  )),
                                ),
                                DeGaps.v16,
                                DeGaps.v16,
                              ],
                            ),
                          );
                        },
                      );
                    },
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
      final bool isSelected = title == '모두';

      return DeGestureDetector(
        onTap: () {},
        child: Container(
          padding: DeDimensions.padding10x4,
          decoration: BoxDecoration(
            color: isSelected ? DeColors.grey10 : DeColors.grey110,
            borderRadius: BorderRadius.circular(6),
          ),
          child: DeText(
            title,
            style: DeFonts.body14Sb.copyWith(
                color: isSelected ? DeColors.grey120 : DeColors.grey50),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
      ),
    );
  }

  Widget _mediaList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _mediaItem(index);
      },
      separatorBuilder: (context, index) => DeGaps.v12,
      itemCount: 4,
    );
  }

  Widget _mediaItem(int index) {
    return DeGestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 78,
            height: 78,
            decoration: ShapeDecoration(
                color: DeColors.brand,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://picsum.photos/seed/picsum/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                      width: 28,
                      height: 28,
                      padding: DeDimensions.all8,
                      // todo padding 수정필요
                      decoration: BoxDecoration(
                        color: DeColors.trans50,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        DeIcons.icExitGrey10,
                      )),
                ),
              ],
            ),
          ),
          DeGaps.h12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DeText(
                        '[단독]구귀비 구귀비 텃구귀비 텃구귀비 텃텃',
                        style: DeFonts.body16M.copyWith(color: DeColors.grey10),
                        overflow: TextOverflow.ellipsis,
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
                    DeText('공급자',
                        style: DeFonts.caption12M
                            .copyWith(color: DeColors.grey50)),
                    DeGaps.h6,
                    SvgPicture.asset(
                      DeIcons.icDotGrey50,
                    ),
                    DeGaps.h6,
                    DeText('1일 전',
                        style: DeFonts.caption12M
                            .copyWith(color: DeColors.grey50)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
