import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/users_logout_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/remote/request/users_logout_req.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/users_logout_repository.dart';

class UsersLogoutRepositoryImpl implements UsersLogoutRepository {
  final UsersLogoutDataSource dataSource;

  UsersLogoutRepositoryImpl(this.dataSource);

  @override
  Future<String> postUsersLogout() async {
    final storage = SecureStorageService();
    final pref = SharedPreferencesService();
    final refreshToken = await storage.getRefreshToken();

    final response = await dataSource.postUsersLogout(
      body: UsersLogoutReq(refreshToken: refreshToken),
    );

    switch (response.status) {
      case 200:
        await Future.wait([
          storage.clear(),
          pref.clear(),
        ]);

        return response.message;
      default:
        if (response.message.isEmpty) {
          return '서버통신에 문제가 발생했습니다.';
        }

        return response.message;
    }
  }
}
