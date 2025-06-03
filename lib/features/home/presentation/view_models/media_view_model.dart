import 'package:debateseason_frontend_v1/features/home/data/models/media/media_item_res.dart';
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

  String? lastFetchedTime;
  final RxBool isAppending = false.obs;

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

  // Future<void> appendMediaData({String? type}) async {
  //   if (isAppending.value || lastFetchedTime == null) return;
  //
  //   isAppending.value = true;
  //
  //   try {
  //     final response = await _mediaRepository.getMedia(
  //       type: type,
  //       time: lastFetchedTime,
  //     );
  //
  //     // 🟡 response는 UiState<MediaEntity>니까 when으로 분기
  //     response.when(
  //       loading: () {
  //         // 무시 (이미 로딩 중)
  //       },
  //       failure: (message) {
  //         log.e("📛 append 실패: $message");
  //       },
  //       success: (newData) {
  //         final newItems = newData.items;
  //
  //         // 현재 상태도 success인 경우에만 병합
  //         _mediaData.value = _mediaData.value.maybeWhen(
  //           success: (currentData) {
  //             final mergedItems = [...currentData.items, ...newItems];
  //             lastFetchedTime = newItems.isNotEmpty
  //                 ? newItems.last.createdAt.toIso8601String()
  //                 : lastFetchedTime;
  //
  //             return UiState.success(MediaEntity(items: mergedItems));
  //           },
  //           orElse: () => _mediaData.value, // 현재 상태 유지
  //         );
  //       },
  //     );
  //   } catch (e, s) {
  //     log.e("🔥 append 예외 발생: $e");
  //     log.e(s);
  //   } finally {
  //     isAppending.value = false;
  //   }
  // }
}
