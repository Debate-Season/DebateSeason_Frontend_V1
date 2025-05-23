import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/media_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class MediaViewModel extends GetxController {
  late final MediaRepository _mediaRepository;
  final _mediaData = Rx<UiState<MediaEntity>>(const UiState.loading());

  UiState<MediaEntity> get mediaData => _mediaData.value;

  @override
  void onInit() {
    super.onInit();
    _mediaRepository = Get.find<MediaRepository>();
    fetchMediaData();
  }

  Future<void> fetchMediaData() async {
    try {
      final response = await _mediaRepository.getMedia();
      _mediaData.value = response;
    } catch (e) {
      log.d(e);
    }
  }
}
