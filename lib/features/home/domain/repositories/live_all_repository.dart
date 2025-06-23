import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class LiveAllRepository {
  Future<UiState<List<YoutubeLiveEntity>>> getLiveAll();
}