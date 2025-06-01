import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/media_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaViewModel extends GetxController {
  late final MediaRepository _mediaRepository;
  final _mediaData = Rx<UiState<MediaEntity>>(const UiState.loading());

  UiState<MediaEntity> get mediaData => _mediaData.value;

  final showPip = false.obs;
  late YoutubePlayerController youtubePlayerController;

  void initYoutube(String videoId) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  void togglePip(String videoId){
    if (!showPip.value) {
      initYoutube(videoId);
    }
    showPip.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    log.d('📌 RecommendViewModel onInit 호출됨');
    _mediaRepository = Get.find<MediaRepository>();
    fetchMediaData();
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }

  Future<void> fetchMediaData() async {
    try {
      final response = await _mediaRepository.getMedia();
      log.d(response);
      _mediaData.value = response;
    } catch (e, s) {
      log.d(e);
      log.d(s);
    }
  }
}
