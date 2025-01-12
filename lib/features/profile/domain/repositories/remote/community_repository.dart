import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class CommunityRepository {
  Future<UiState<List<CommunityEntity>>> getCommunities();

  Future<UiState<List<CommunityEntity>>> getCommunitiesSearch({
    required String searchWord,
  });
}
