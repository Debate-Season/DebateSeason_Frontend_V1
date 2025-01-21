import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/users_withdraw_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/users_withdraw_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class UsersWithdrawRepositoryImpl implements UsersWithdrawRepository {
  final UsersWithdrawDataSource dataSource;

  UsersWithdrawRepositoryImpl(this.dataSource);

  @override
  Future<UiState<String>> postUsersWithdraw() async {
    final response = await dataSource.postUsersWithdraw();

    switch (response.status) {
      case 200:
        final storage = SecureStorageService();
        final pref = SharedPreferencesService();

        await Future.wait([
          storage.clear(),
          pref.clear(),
        ]);

        return UiState.success(response.message);
      default:
        if (response.message.isEmpty) {
          return UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}
