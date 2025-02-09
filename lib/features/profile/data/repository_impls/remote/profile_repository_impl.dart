import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/mapper/profile_mapper.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<UiState<ProfileEntity>> getProfile() async {
    final response = await dataSource.getProfilesMe();

    switch (response.status) {
      case 200:
        final pref = SharedPreferencesService();
        pref.setProfileStatus(profileStatus: true);

        return UiState.success(
          ProfileMapper.toEntity(res: response.data),
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }

  @override
  Future<UiState<String>> postProfile({
    required ProfileEntity entity,
  }) async {
    final response = await dataSource.postProfiles(
      body: ProfileMapper.toReq(entity: entity),
    );

    switch (response.status) {
      case 200 || 201:
        final pref = SharedPreferencesService();
        await Future.wait([
          pref.setProfileStatus(profileStatus: true),
          pref.setNickname(nickname: entity.nickname),
          pref.setCommunity(community: entity.community.name),
        ]);

        return (UiState.success(response.message));
      default:
        if (response.message.isEmpty) {
          (UiState.failure('서버통신에 문제가 발생했습니다.'));
        }

        return (UiState.failure(response.message));
    }
  }

  @override
  Future<UiState<String>> patchProfile({required ProfileEntity entity}) async {
    final response = await dataSource.patchProfiles(
      body: ProfileMapper.toReq(entity: entity),
    );

    switch (response.status) {
      case 200:
        final pref = SharedPreferencesService();
        await Future.wait([
          pref.setNickname(nickname: entity.nickname),
          pref.setCommunity(community: entity.community.name),
        ]);

        return UiState.success(
          response.message,
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}
