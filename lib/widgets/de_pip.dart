import 'package:debateseason_frontend_v1/core/services/pip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PipOverlay extends StatelessWidget {
  const PipOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final pipController = Get.find<PipController>();
    final screenSize = MediaQuery.of(context).size;
    final pipWidth = screenSize.width * 0.5;
    final pipHeight = pipWidth * 9 / 16;

    return Obx(() {
      if (!pipController.showPip.value) return const SizedBox.shrink();

      return Positioned(
        bottom: 20,
        right: 20,
        child: GestureDetector(
          onTap: () {
            pipController.showPip.value = false; // 탭 시 닫기
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
                controller: pipController.youtubePlayerController!,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
        ),
      );
    });
  }
}
