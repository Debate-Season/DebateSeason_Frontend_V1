import 'package:debateseason_frontend_v1/features/home/data/datasources/live_all_data_source.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/live_all_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class LiveAllRepositoryImpl implements LiveAllRepository {
  final LiveAllDataSource dataSource;

  LiveAllRepositoryImpl(this.dataSource);

  @override
  Future<UiState<List<YoutubeLiveEntity>>> getLiveAll() async {
    final response = await dataSource.getLiveAll();
    switch (response.status) {
      case 200:
        final lives = response.data.youtubeLives;
        final entities = lives.map((e) => e.toEntity()).toList();
        return UiState.success(entities);
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오는데 에러가 발생했습니다.');
        }
    }
    return UiState.failure(response.message);
  }
}
