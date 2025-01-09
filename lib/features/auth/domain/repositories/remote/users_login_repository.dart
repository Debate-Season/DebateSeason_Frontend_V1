import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';

abstract class UsersLoginRepository {
  Future<bool> postUsersLogin({
    required UsersLoginEntity entity,
  });
}
