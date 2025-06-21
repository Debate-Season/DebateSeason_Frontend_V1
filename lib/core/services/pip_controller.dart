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
  bool movedByUserWhileKeyboardUp = false;

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
    if (youtubePlayerController == null) {
      initYoutube(videoId);
    } else if (currentVideoId != videoId) {
      youtubePlayerController!.load(videoId);
      currentVideoId = videoId;
    }
    showPip.value = true;
  }

  void hide() {
    showPip.value = false;
    youtubePlayerController?.pause();
  }

  void updateOffset(Offset delta) {
    pipOffset.value += delta;

    final keyboardVisible =
        WidgetsBinding.instance.window.viewInsets.bottom > 0;
    if (keyboardVisible) {
      movedByUserWhileKeyboardUp = true;
    }
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

    if (keyboardHeight > 0) {
      final double snapY = bottomLimit - pipH - 10;
      corners.addAll([
        Offset(20, snapY), // 키보드 좌상단
        Offset(screenW - pipW - 20, snapY), // 키보드 우상단
      ]);
    }

    final isBelowKeyboard = current.dy + pipH > bottomLimit;
    final filtered = corners.where((offset) {
      return offset.dy + pipH <= bottomLimit;
    }).toList();

    if (isBelowKeyboard && filtered.isEmpty) {
      pipOffset.value = Offset(
        pipOffset.value.dx,
        bottomLimit - pipH - 10,
      );
      return;
    }

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
    Future.delayed(const Duration(seconds: 3), () {
      isControlVisible.value = false;
    });
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    youtubePlayerController?.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void didChangeMetrics() {
    final viewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    final isKeyboardVisible = viewInsets > 0;
    final keyboardHeight = viewInsets / window.devicePixelRatio;

    if (pipSize.height == 0) return;

    final pipBottom = pipOffset.value.dy + pipSize.height;
    final screenBottom = Get.height;
    final keyboardTop = screenBottom - keyboardHeight;
    final overlapsKeyboard = pipBottom > keyboardTop;

    if (isKeyboardVisible) {
      if (overlapsKeyboard) {
        if (originalOffsetBeforeKeyboard == null) {
          originalOffsetBeforeKeyboard = pipOffset.value;
          movedByUserWhileKeyboardUp = false;
        }

        final newY = keyboardTop - pipSize.height - 20;
        pipOffset.value = Offset(pipOffset.value.dx, newY);
      }
    } else {
      if (originalOffsetBeforeKeyboard != null && !movedByUserWhileKeyboardUp) {
        final snapY = Get.height - pipSize.height - 20;
        final wasSnappedToKeyboardTop =
            originalOffsetBeforeKeyboard!.dy <= keyboardTop - pipSize.height;

        if (wasSnappedToKeyboardTop) {
          pipOffset.value = Offset(pipOffset.value.dx, snapY);
        } else {
          pipOffset.value = originalOffsetBeforeKeyboard!;
        }
      }

      if (movedByUserWhileKeyboardUp) {
        final Offset current = pipOffset.value;
        final screenW = Get.width;
        final pipW = pipSize.width;

        final bool isTopLeft = (current.dx - 20).abs() < 10 && (current.dy - 40).abs() < 10;
        final bool isTopRight = (current.dx - (screenW - pipW - 20)).abs() < 10 &&
            (current.dy - 40).abs() < 10;

        if (!isTopLeft && !isTopRight) {
          pipOffset.value = Offset(
            current.dx,
            Get.height - pipSize.height - 20,
          );
        }
      }

      originalOffsetBeforeKeyboard = null;
      movedByUserWhileKeyboardUp = false;
    }
  }
}
