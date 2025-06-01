import 'package:debateseason_frontend_v1/features/home/data/datasources/media_data_source.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/media_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaDataSource dataSource;

  MediaRepositoryImpl(this.dataSource);

  @override
  Future<UiState<MediaEntity>> getMedia() async {
    final response = await dataSource.getMedia();
    switch (response.status) {
      case 200:
        return UiState.success(response.data.toEntity());
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오는데 에러가 발생했습니다.');
        }
    }
    return UiState.failure(response.message);
  }
}
