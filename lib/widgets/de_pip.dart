import 'package:debateseason_frontend_v1/core/services/pip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DePip extends StatelessWidget {
  const DePip({super.key});

  @override
  Widget build(BuildContext context) {
    final pipController = Get.find<PipController>();
    final screenSize = MediaQuery.of(context).size;
    final pipWidth = screenSize.width * 0.5;
    final pipHeight = pipWidth * 9 / 16;

    return Obx(() {
      if (!pipController.showPip.value ||
          pipController.youtubePlayerController == null) {
        return const SizedBox.shrink();
      }

      final offset = pipController.pipOffset.value;

      return Positioned(
        bottom: offset.dx,
        right: offset.dy,
        child: GestureDetector(
          // onTap: () {
          //   pipController.showPip.value = false; // 탭 시 닫기
          // },
          onPanUpdate: (details) {
            pipController.updateOffset(details.delta);
          },
          onPanEnd: (_){
            pipController.snapToCorner(screenSize, Size(pipWidth, pipHeight));
          },
          child: Container(
            width: pipWidth,
            height: pipHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: YoutubePlayer(
                    controller: pipController.youtubePlayerController!,
                    showVideoProgressIndicator: true,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: pipController.hide,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
