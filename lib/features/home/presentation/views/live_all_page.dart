import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/services/pip_controller.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/live_view_model.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/de_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_progress_indicator.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:debateseason_frontend_v1/widgets/de_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

class LiveAllPage extends GetView<LiveViewModel> {
  const LiveAllPage({super.key});

  PipController get pipController => Get.find<PipController>();

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      title: DeText('라이브 모두 보기', style: DeFonts.header18Sb),
      // actions: [
      //   DeGestureDetector(
      //     onTap: () {},
      //     child: Padding(
      //       padding: DeDimensions.all8,
      //       child: SvgPicture.asset(DeIcons.icBookmarkGrey50),
      //     ),
      //   ),
      //   DeGestureDetector(
      //     onTap: () {},
      //     child: Padding(
      //       padding: DeDimensions.all8,
      //       child: SvgPicture.asset(DeIcons.icAssistantGrey50),
      //     ),
      //   ),
      // ],
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: ListView(
        children: [
          _liveList(),
        ],
      ),
    );
  }

  Widget _liveList() {
    return Obx(
      () {
        final liveList = controller.liveList;
        return liveList.when(
          loading: () => const Center(child: DeProgressIndicator()),
          success: (liveList) {
            log.d(liveList.length);
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: liveList.length,
              itemBuilder: (context, index) {
                return _liveItem(liveList[index]);
              },
            );
          },
          failure: (error) => Center(
              child: DeText(
            error,
            style: DeFonts.body16Sb.copyWith(color: DeColors.red),
          )),
        );
      },
    );
  }

  Widget _liveItem(YoutubeLiveEntity live) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DeGestureDetector(
          onTap: () {
            pipController.show(live.videoId);
          },
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: DeColors.brand,
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.youtube.com/vi/${live.videoId}/hqdefault.jpg',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        DeGaps.v8,
        SizedBox(
          child: DeGestureDetector(
            onTap: () {
              pipController.show(live.videoId);
            },
            child: DeText(
              HtmlUnescape().convert(live.title),
              style: DeFonts.body16M.copyWith(color: DeColors.grey10),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              DeIcons.icYoutubeLogoGrey50,
            ),
            DeGaps.h4,
            DeText('YouTube',
                style: DeFonts.caption12M.copyWith(color: DeColors.grey50)),
            DeGaps.h6,
            SvgPicture.asset(
              DeIcons.icDotGrey50,
            ),
            DeGaps.h6,
            DeText(live.supplier,
                style: DeFonts.caption12M.copyWith(color: DeColors.grey50)),
            DeGaps.h6,
            SvgPicture.asset(
              DeIcons.icDotGrey50,
            ),
            DeGaps.h6,
            DeText(live.createAt.toString().substring(0, 16),
                style: DeFonts.caption12M.copyWith(color: DeColors.grey50)),
          ],
        ),
        DeGaps.v28,
      ],
    );
  }
}
