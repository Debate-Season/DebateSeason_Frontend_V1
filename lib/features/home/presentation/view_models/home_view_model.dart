import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/recommend_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/media_repository.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/recommend_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  late final RecommendRepository _recommendRepository;
  final _recommendData = Rx<UiState<RecommendEntity>>(const UiState.loading());

  UiState<RecommendEntity> get recommendData => _recommendData.value;

  late final MediaRepository _mediaRepository;
  final _mediaData = Rx<UiState<MediaEntity>>(const UiState.loading());

  UiState<MediaEntity> get mediaData => _mediaData.value;

  @override
  void onInit() {
    super.onInit();
    _recommendRepository = Get.find<RecommendRepository>();
    _mediaRepository = Get.find<MediaRepository>();
    fetchRecommendData();
  }

  Future<void> fetchRecommendData() async {
    try {
      final response = await _recommendRepository.getRecommend();
      _recommendData.value = response;
    } catch (e) {
      log.d(e);
    }
  }
}
