import 'package:debateseason_frontend_v1/features/home/data/datasources/recommend_data_source.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/recommend_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/recommend_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class RecommendRepositoryImpl implements RecommendRepository {
  final RecommendDataSource dataSource;

  RecommendRepositoryImpl(this.dataSource);

  @override
  Future<UiState<RecommendEntity>> getRecommend() async {
    final response = await dataSource.getRecommend();
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
