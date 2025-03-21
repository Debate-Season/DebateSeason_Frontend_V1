import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_login_req.g.dart';

@JsonSerializable()
class UsersLoginReq {
  String idToken;
  String socialType;

  UsersLoginReq({
    required this.idToken,
    required this.socialType,
  });

  toJson() => _$UsersLoginReqToJson(this);

  fromJson(json) => _$UsersLoginReqFromJson(json);

  factory UsersLoginReq.fromEntity(UsersLoginEntity entity) {
    return UsersLoginReq(
      idToken: entity.idToken,
      socialType: entity.socialType,
    );
  }
}
