import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class UsersLogoutRepository {
  Future<UiState<void>> postUsersLogout();
}
