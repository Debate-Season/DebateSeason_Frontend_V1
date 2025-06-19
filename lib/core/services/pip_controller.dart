import 'dart:ui';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PipController extends GetxController {
  YoutubePlayerController? youtubePlayerController;
  final showPip = false.obs;
  final isControlVisible = false.obs;
  String? currentVideoId;

  final pipOffset = Rx<Offset>(const Offset(20, 100));

  void initYoutube(String videoId) {
    if (currentVideoId == videoId && youtubePlayerController != null) return;
    currentVideoId = videoId;

    youtubePlayerController?.dispose();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        hideControls: false,
      ),
    );
  }

  void show(String videoId) {
    if (currentVideoId != videoId) {
      initYoutube(videoId);
    }
    showPip.value = true;
  }

  void hide() {
    showPip.value = false;
    youtubePlayerController?.pause();
  }

  void updateOffset(Offset delta) {
    pipOffset.value += delta;
  }

  void snapToCorner(Size screenSize, Size pipSize) {
    final Offset current = pipOffset.value;
    final double screenW = screenSize.width;
    final double screenH = screenSize.height;
    final double pipW = pipSize.width;
    final double pipH = pipSize.height;

    final List<Offset> corners = [
      const Offset(20, 20), // top-left
      Offset(screenW - pipW - 20, 20), // top-right
      Offset(20, screenH - pipH - 20), // bottom-left
      Offset(screenW - pipW - 20, screenH - pipH - 20), // bottom-right
    ];

    // 가장 가까운 코너 계산
    Offset closest = corners.first;
    double minDistance = (current - closest).distance;

    for (var corner in corners) {
      double distance = (current - corner).distance;
      if (distance < minDistance) {
        minDistance = distance;
        closest = corner;
      }
    }

    pipOffset.value = closest;
  }

  void showControls() {
    isControlVisible.value = true;
    Future.delayed(const Duration(seconds: 3),(){
      isControlVisible.value = false;
    });
  }

  @override
  void onClose() {
    youtubePlayerController?.dispose();
    super.onClose();
  }
}
