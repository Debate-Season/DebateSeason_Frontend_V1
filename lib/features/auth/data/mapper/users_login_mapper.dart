import 'package:debateseason_frontend_v1/features/auth/data/models/remote/request/users_login_req.dart';
import 'package:debateseason_frontend_v1/features/auth/data/models/remote/response/users_login_res.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';

class UsersLoginMapper {
  static UsersLoginReq toRequest(UsersLoginEntity entity) {
    return UsersLoginReq(
      identifier: entity.identifier,
      socialType: entity.socialType,
    );
  }

  static UsersLoginEntity toEntity(UsersLoginRes res) {
    return UsersLoginEntity(
      accessToken: res.accessToken,
      refreshToken: res.refreshToken,
      socialType: res.socialType,
      profileStatus: res.profileStatus,
    );
  }
}
