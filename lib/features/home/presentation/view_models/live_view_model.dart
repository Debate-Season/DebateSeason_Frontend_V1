import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/live_all_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class LiveViewModel extends GetxController {
  late final LiveAllRepository _liveAllRepository;
  final _liveList = Rx<UiState<List<YoutubeLiveEntity>>>(
    const UiState.loading());

  UiState<List<YoutubeLiveEntity>> get liveList => _liveList.value;

  final showPip = false.obs;

  @override
    void onInit() {
    super.onInit();
    _liveAllRepository = Get.find<LiveAllRepository>();
    getLiveAll();
  }
  Future<void> getLiveAll() async {
    try {
      final response = await _liveAllRepository.getLiveAll();
      log.d(response);
      _liveList.value = response;
    } catch (e, s) {
      log.e(e);
      log.e(s);
    }
  }
}