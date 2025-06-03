import 'package:debateseason_frontend_v1/features/home/data/datasources/live_all_data_source.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/live_all_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/media/youtube_live_res.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/live_all_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';

class LiveAllRepositoryImpl implements LiveAllRepository {
  final LiveAllDataSource dataSource;

  LiveAllRepositoryImpl(this.dataSource);

  @override
  Future<UiState<List<YoutubeLiveEntity>>> getLiveAll() async {
    final response = await dataSource.getLiveAll();
    switch (response.status) {
      case 200:
        //return UiState.success(response.data.toEntityList());

        // final lives = (response.data as LiveAllRes).youtubeLives;
        // final entities = lives.map((e) => e.toEntity()).toList();
        // return UiState.success(entities);

        // log.d("💬 변환 전 모델 수: ${response.data.length}");
        // final entities = response.data.map((e) {
        //   final entity = e.toEntity();
        //   log.d("🎯 변환된 entity: ${entity.title}");
        //   return entity;
        // }).toList();
        // log.d("🎯 최종 entity 수: ${entities.length}");
        // return UiState.success(entities);

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
