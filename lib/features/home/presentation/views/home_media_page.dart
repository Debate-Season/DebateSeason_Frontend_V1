import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/pip_controller.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/media_item_entity.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/media_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/web_view_page.dart';
import 'package:debateseason_frontend_v1/utils/de_toast.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_bottom_sheet_notitle.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

class HomeMediaPage extends GetView<MediaViewModel> {
  const HomeMediaPage({super.key});

  PipController get pipController => Get.find<PipController>();

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Obx(() {
            final state = controller.mediaData;
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (msg) => Center(
                  child: DeText(msg,
                      style: DeFonts.body16Sb.copyWith(color: DeColors.red))),
              success: (media) {
                final items = media.items;
                // 0: v4, 1: mainMedia, 2: v40, 3: header, 4~: items, 마지막: 로더
                final totalCount =
                    4 + items.length + (controller.hasMore ? 1 : 0);

                return ListView.builder(
                  controller: controller.scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: totalCount,
                  itemBuilder: (ctx, idx) {
                    switch (idx) {
                      case 0:
                        return DeGaps.v4;
                      case 1:
                        return _mainMedia(context);
                      case 2:
                        return DeGaps.v40;
                      case 3:
                        return _mediaHeader();
                      default:
                        final itemIndex = idx - 4;
                        if (itemIndex < items.length) {
                          return Padding(
                            padding: DeDimensions.padding20x12,
                            child: _mediaItem(items[itemIndex]),
                          );
                        }
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                    }
                  },
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _mainMedia(BuildContext context) {
    return Obx(() {
      final youtubeData = controller.mediaData;
      return youtubeData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (youtubeData) {
          final youtube = youtubeData.youtubeLive;
          if (youtube.isEmpty) {
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
                  //controller.togglePip(youtube[0].videoId);
                  pipController.show(youtube[0].videoId);
                },
                child: Container(
                  width: double.infinity,
                  height: 180,
                  color: DeColors.brand,
                  child: Image.network(
                    'https://img.youtube.com/vi/${youtube[0].videoId}/hqdefault.jpg',
                    //youtube[0].src.toString(), 이거 화질 안 좋다
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
                              HtmlUnescape().convert(youtube[0].title),
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
                                                  'https://youtube.com/${youtube[0].videoId}'));
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
                        DeText(youtube[0].supplier,
                            style: DeFonts.caption12M
                                .copyWith(color: DeColors.grey50)),
                        DeGaps.h6,
                        SvgPicture.asset(
                          DeIcons.icDotGrey50,
                        ),
                        DeGaps.h6,
                        DeText(youtube[0].createAt.toString().substring(0, 16),
                            style: DeFonts.caption12M
                                .copyWith(color: DeColors.grey50)),
                      ],
                    ),
                  ],
                ),
              ),
              DeGaps.v20,
              Padding(
                padding: DeDimensions.horizontal20,
                child: DeGestureDetector(
                  onTap: () {
                    Get.toNamed(GetRouterName.lives);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: DeDimensions.vertical8,
                    decoration: ShapeDecoration(
                      color: DeColors.grey110,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeText(
                          '라이브 모두 보기',
                          style:
                              DeFonts.body14M.copyWith(color: DeColors.grey50),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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

  Widget _mediaHeader() {
    /*Widget mediaCategory() {
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
    }*/

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
          //DeGaps.v16,
          //mediaCategory(),
          //DeGaps.v20,
        ],
      ),
    );
  }

  Widget _mediaItem(MediaItemEntity media) {
    return DeGestureDetector(
      onTap: () {
        Get.to(() => WebViewPage(
              url: media.url,
              title: media.title,
            ));
      },
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
                  child: media.src != null
                      ? Image.network(
                          media.src!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/img_media_thumbnail.png',
                          fit: BoxFit.cover,
                        ),
                ),
                // Positioned(
                //   right: 6,
                //   top: 6,
                //   child: Container(
                //       width: 28,
                //       height: 28,
                //       padding: DeDimensions.all8,
                //       // todo padding 수정필요
                //       decoration: BoxDecoration(
                //         color: DeColors.trans50,
                //         shape: BoxShape.circle,
                //       ),
                //       child: SvgPicture.asset(
                //         {
                //               'YOUTUBE': DeIcons.icYoutubeGrey10,
                //               'ARTICLE': DeIcons.icArticleGrey10,
                //               'COMM': DeIcons.icCommGrey10,
                //             }[media.supplier] ??
                //             '',
                //       )),
                // ),
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
                        HtmlUnescape().convert(media.title),
                        style: DeFonts.body16M.copyWith(color: DeColors.grey10),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DeGaps.h12,
                    DeGestureDetector(
                      onTap: () {
                        Get.bottomSheet(DeBottomSheetNoTitle(
                          widget: Column(
                            children: [
                              DeGestureDetector(
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: media.url));
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
                                        style: DeFonts.body16M
                                            .copyWith(color: DeColors.grey10)),
                                  ],
                                )),
                              ),
                              DeGaps.v16,
                            ],
                          ),
                        ));
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
                    DeText(media.supplier,
                        style: DeFonts.caption12M
                            .copyWith(color: DeColors.grey50)),
                    DeGaps.h6,
                    SvgPicture.asset(
                      DeIcons.icDotGrey50,
                    ),
                    DeGaps.h6,
                    DeText(media.outdated.toString().substring(0, 10),
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
