import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class MediaRepository {
  Future<UiState<MediaEntity>> getMedia({String? type, String? time});
}
