import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/request/profile_image_req.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/request/profile_req.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
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
          response.data.toEntity(),
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }

  @override
  Future<UiState<void>> postProfile({
    required ProfileEntity entity,
  }) async {
    final response = await dataSource.postProfiles(
      body: ProfileReq.fromEntity(entity),
    );

    switch (response.status) {
      case 200 || 201:
        final pref = SharedPreferencesService();
        await Future.wait([
          pref.setProfileStatus(profileStatus: true),
          pref.setNickname(nickname: entity.nickname),
          pref.setCommunity(community: entity.community.name),
        ]);

        return (UiState.success(null));
      default:
        if (response.message.isEmpty) {
          (UiState.failure('서버통신에 문제가 발생했습니다.'));
        }

        return (UiState.failure(response.message));
    }
  }

  @override
  Future<UiState<void>> patchProfile({required ProfileEntity entity}) async {
    final response = await dataSource.patchProfiles(
      body: ProfileReq.fromEntity(entity),
    );

    switch (response.status) {
      case 200:
        final pref = SharedPreferencesService();
        await Future.wait([
          pref.setNickname(nickname: entity.nickname),
          pref.setCommunity(community: entity.community.name),
        ]);

        return UiState.success(null);
      default:
        if (response.message.isEmpty) {
          UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }

  @override
  Future<UiState<void>> patchProfileImage({
    required String profileImage,
  }) async {
    final response = await dataSource.patchProfilesImage(
      body: ProfileImageReq.fromEntity(profileImage),
    );

    switch (response.status) {
      case 200 || 201:

        return (UiState.success(null));
      default:
        if (response.message.isEmpty) {
          (UiState.failure('서버통신에 문제가 발생했습니다.'));
        }

        return (UiState.failure(response.message));
    }
  }
}
