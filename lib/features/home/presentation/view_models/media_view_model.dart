import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/media_item_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/media_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaViewModel extends GetxController {
  late final MediaRepository _mediaRepository;
  final _mediaData = Rx<UiState<MediaEntity>>(const UiState.loading());

  UiState<MediaEntity> get mediaData => _mediaData.value;

  static const int _pageSize = 5;
  String? lastFetchedTime;
  bool hasMore = true;
  final RxBool isAppending = false.obs;

  final ScrollController scrollController = ScrollController();

  final List<MediaItemEntity> _allItems = [];
  List<YoutubeLiveEntity> _initialYoutubeLive = [];

  final showPip = false.obs;
  late YoutubePlayerController youtubePlayerController;

  void initYoutube(String videoId) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  void togglePip(String videoId) {
    if (!showPip.value) {
      initYoutube(videoId);
    }
    showPip.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    _mediaRepository = Get.find<MediaRepository>();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        fetchMediaData();
      }
    });

    fetchMediaData();
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    scrollController
      ..removeListener(() {})
      ..dispose();
    super.onClose();
  }

  Future<void> fetchMediaData({String? type}) async {
    if (!hasMore || isAppending.value) return;
    isAppending.value = true;

    if (lastFetchedTime == null) {
      _allItems.clear();
      _initialYoutubeLive.clear();
      _mediaData.value = const UiState.loading();
    }

    try {
      final result = await _mediaRepository.getMedia(
        type: type,
        time: lastFetchedTime,
      );

      result.when(
        loading: () {
          // 이미 loading 상태는 처리했으므로 무시
        },
        success: (media) {
          if (_initialYoutubeLive.isEmpty) {
            _initialYoutubeLive = media.youtubeLive;
          }

          // items 누적
          if (media.items.isNotEmpty) {
            _allItems.addAll(media.items);

            lastFetchedTime = media.items.last.outdated.toIso8601String();

            if (media.items.length < _pageSize) {
              hasMore = false;
            }
          } else {
            hasMore = false;
          }

          final combined = MediaEntity(
            youtubeLive: _initialYoutubeLive,
            items: _allItems,
          );
          _mediaData.value = UiState.success(combined);
        },
        failure: (msg) {
          _mediaData.value = UiState.failure(msg);
        },
      );
    } catch (e, s) {
      log.e('fetchMediaData error: $e');
      log.e('s');
      _mediaData.value = const UiState.failure('네트워크 오류가 발생했습니다.');
    } finally {
      isAppending.value = false;
    }
  }
}
