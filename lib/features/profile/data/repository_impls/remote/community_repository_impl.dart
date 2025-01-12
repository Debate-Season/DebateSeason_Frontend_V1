import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/community_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/mapper/community_mapper.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/community_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityDataSource dataSource;

  CommunityRepositoryImpl(this.dataSource);

  @override
  Future<UiState<List<CommunityEntity>>> getCommunities() async {
    final response = await dataSource.getCommunities();

    switch (response.status) {
      case 200:
        if (response.data.isEmpty) {
          return UiState.empty();
        }

        return UiState.success(
          response.data
              .map((res) => CommunityMapper.toEntity(res: res))
              .toList(),
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
        if (response.data.isEmpty) {
          return UiState.empty();
        }

        return UiState.success(
          response.data
              .map((res) => CommunityMapper.toEntity(res: res))
              .toList(),
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오지 못했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}
