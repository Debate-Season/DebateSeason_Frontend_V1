import 'package:debateseason_frontend_v1/features/profile/data/data_sources/community_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/community_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityDataSource dataSource;

  CommunityRepositoryImpl(this.dataSource);

  @override
  Future<UiState<List<CommunityEntity>>> getCommunities() async {
    final response = await dataSource.getCommunities();

    // TODO: 디버깅용 로그 (확인 후 삭제)
    for (final community in response.data) {
      log.d('Community: ${community.name}, iconUrl: ${community.iconUrl}');
    }

    switch (response.status) {
      case 200:
        return UiState.success(
          response.data.map((res) => res.toEntity()).toList(),
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오지 못했습니다.');
        }

        return UiState.failure(response.message);
    }
  }

  @override
  Future<UiState<List<CommunityEntity>>> getCommunitiesSearch({
    required String searchWord,
  }) async {
    final response = await dataSource.getCommunitiesSearch(
      searchWord: searchWord,
    );

    switch (response.status) {
      case 200:
        return UiState.success(
          response.data.map((res) => res.toEntity()).toList(),
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오지 못했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}
