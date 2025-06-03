import 'package:debateseason_frontend_v1/features/home/domain/entities/recommend_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class RecommendRepository {
  Future<UiState<RecommendEntity>> getRecommend();
}