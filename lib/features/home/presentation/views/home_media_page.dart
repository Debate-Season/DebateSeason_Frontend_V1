import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/media_item_entity.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/media_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/web_view_page.dart';
import 'package:debateseason_frontend_v1/utils/de_toast.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_bottom_sheet_notitle.dart';
import 'package:debateseason_frontend_v1/widgets/de_button_large.dart';
import 'package:debateseason_frontend_v1/widgets/de_dialog.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeMediaPage extends GetView<MediaViewModel> {
  const HomeMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            DeGaps.v4, //todo 여백값 정확히 계산
            _mainMedia(context),
            DeGaps.v40,
            _medias(),
          ],
        ),
        _pipOverlay(context),
      ],
    );
  }

  Widget _pipOverlay(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final pipWidth = screenSize.width * 0.5;
    final pipHeight = pipWidth * 9 / 16;

    return Obx(() {
      if (!controller.showPip.value) return const SizedBox.shrink();

      return Positioned(
        bottom: 20,
        right: 20,
        child: GestureDetector(
          onTap: () {
            controller.showPip.value = false; // 탭 시 닫기
          },
          child: Container(
            width: pipWidth,
            height: pipHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: YoutubePlayer(
                controller: controller.youtubePlayerController,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _mainMedia(BuildContext context) {
    return Obx(() {
      final youtubeData = controller.mediaData;
      return youtubeData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (youtubeData) {
          final youtube = youtubeData.youtubeLive;
          if (youtube == null) {
            return Container();
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DeGaps.h20,
                  DeText(
                    '실시간 Live',
                    style: DeFonts.header18Sb.copyWith(color: DeColors.grey10),
                  ),
                ],
              ),
              DeGaps.v12,
              DeGestureDetector(
                onTap: () {
                  // Get.to(() => WebViewPage(
                  //   url: 'https://youtube.com/${youtube.videoId}',
                  //   title: youtube.title,
                  // ));
                  controller.togglePip(youtube.videoId);
                },
                child: Container(
                  width: double.infinity,
                  height: 180,
                  color: DeColors.brand,
                  child: Image.network(
                    'https://img.youtube.com/vi/${youtube.videoId}/hqdefault.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DeGestureDetector(
                            onTap: () {},
                            child: DeText(
                              youtube.title,
                              style: DeFonts.body16M
                                  .copyWith(color: DeColors.grey10),
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
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(
                                              text:
                                                  'https://youtube.com/${youtube.videoId}'));
                                          DeToast.showToast(
                                            msg: 'URL이 복사되었습니다.',
                                          );
                                        },
                                        child: (Row(
                                          children: [
                                            SvgPicture.asset(
                                              DeIcons.icCopyGrey10,
                                            ),
                                            DeGaps.h16,
                                            DeText('URL 복사하기',
                                                style: DeFonts.body16M.copyWith(
                                                    color: DeColors.grey10)),
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
                        DeText(youtube.supplier,
                            style: DeFonts.caption12M
                                .copyWith(color: DeColors.grey50)),
                        DeGaps.h6,
                        // SvgPicture.asset(
                        //   DeIcons.icDotGrey50,
                        // ),
                        // DeGaps.h6,
                        // DeText(youtube.createAt.toString(),
                        //     style: DeFonts.caption12M
                        //         .copyWith(color: DeColors.grey50)),
                      ],
                    ),
                  ],
                ),
              ),
              //DeGaps.v20,
              // DeGaps.v20,
              // Padding(
              //   padding: DeDimensions.horizontal20,
              //   child: DeGestureDetector(
              //     onTap: () {},
              //     child: Container(
              //       width: double.infinity,
              //       padding: DeDimensions.vertical8,
              //       decoration: ShapeDecoration(
              //         color: DeColors.grey110,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           DeText(
              //             '라이브 모두 보기',
              //             style: DeFonts.body14M.copyWith(color: DeColors.grey50),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
        failure: (error) => Center(
          child: DeText(
            error,
            style: DeFonts.body16Sb.copyWith(color: DeColors.red),
          ),
        ),
      );
    });
  }

  Widget _medias() {
    return Padding(
      padding: DeDimensions.padding20x12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeText(
            '실시간 미디어',
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
      separatorBuilder: (context, index) => DeGaps.v16,
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
