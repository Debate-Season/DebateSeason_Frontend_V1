import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/users_withdraw_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/users_withdraw_repository.dart';

class UsersWithdrawRepositoryImpl implements UsersWithdrawRepository {
  final UsersWithdrawDataSource dataSource;

  UsersWithdrawRepositoryImpl(this.dataSource);

  @override
  Future<String> postUsersWithdraw() async {
    final response = await dataSource.postUsersWithdraw();

    final storage = SecureStorageService();
    final pref = SharedPreferencesService();
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
