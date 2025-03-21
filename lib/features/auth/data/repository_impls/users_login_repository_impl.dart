import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/users_login_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/models/request/users_login_req.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/users_login_repository.dart';

class UsersLoginRepositoryImpl implements UsersLoginRepository {
  final UsersLoginDataSource dataSource;

  UsersLoginRepositoryImpl(this.dataSource);

  @override
  Future<bool> postUsersLogin({
    required UsersLoginEntity entity,
  }) async {
    final storage = SecureStorageService();
    final pref = SharedPreferencesService();
    final response = await dataSource.postUsersLogin(
      requestBody: UsersLoginReq.fromEntity(entity),
    );

    await Future.wait([
      storage.setAccessToken(accessToken: response.data.accessToken),
      storage.setRefreshToken(refreshToken: response.data.refreshToken),
      pref.setSocialType(socialType: entity.socialType),
      pref.setProfileStatus(profileStatus: response.data.profileStatus),
    ]);

    return response.data.profileStatus;
  }
}
