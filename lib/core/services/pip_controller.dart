import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PipController extends GetxController with WidgetsBindingObserver {
  YoutubePlayerController? youtubePlayerController;
  final showPip = false.obs;
  final isControlVisible = false.obs;
  String? currentVideoId;

  final pipOffset = Rx<Offset>(const Offset(20, 40));
  late Size pipSize;
  Offset? originalOffsetBeforeKeyboard;

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

  void snapToCorner(Size screenSize, Size size) {
    pipSize = size;
    final Offset current = pipOffset.value;
    final double screenW = screenSize.width;
    final double screenH = screenSize.height;
    final double pipW = pipSize.width;
    final double pipH = pipSize.height;

    final keyboardHeight = WidgetsBinding.instance.window.viewInsets.bottom /
        window.devicePixelRatio;
    final double bottomLimit = screenH - keyboardHeight;

    final List<Offset> corners = [
      const Offset(20, 40), // top-left
      Offset(screenW - pipW - 20, 40), // top-right
      Offset(20, screenH - pipH - 20), // bottom-left
      Offset(screenW - pipW - 20, screenH - pipH - 20), // bottom-right
      Offset(20, (screenH - pipH) / 2), // left-center
      Offset(screenW - pipW - 20, (screenH - pipH) / 2), // right-center
    ];

    final filtered = corners.where((offset) {
      return offset.dy + pipH <= bottomLimit;
    });

    Offset closest = filtered.first;
    double minDistance = (current - closest).distance;

    for (final corner in filtered) {
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
