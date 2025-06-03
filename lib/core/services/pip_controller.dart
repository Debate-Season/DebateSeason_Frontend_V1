import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PipController extends GetxController {
  YoutubePlayerController? youtubePlayerController;
  final showPip = false.obs;
  String? currentVideoId;

  void initYoutube(String videoId) {
    if (currentVideoId == videoId && youtubePlayerController != null) return;
    currentVideoId = videoId;

    youtubePlayerController?.dispose();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  void togglePip(String videoId) {
    if (!showPip.value) {
      initYoutube(videoId);
    }
    showPip.toggle();
  }

  void show(String videoId) {
    // 이미 초기화된 경우 dispose 해주기
    if (youtubePlayerController != null) {
      youtubePlayerController!.dispose();
    }

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
    showPip.value = true;
  }

  void hide() {
    showPip.value = false;
    youtubePlayerController?.pause();
  }

  @override
  void onClose() {
    youtubePlayerController?.dispose();
    super.onClose();
  }
}