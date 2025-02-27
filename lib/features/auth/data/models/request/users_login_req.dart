import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_login_req.g.dart';

@JsonSerializable()
class UsersLoginReq {
  String identifier;
  String socialType;

  UsersLoginReq({
    required this.identifier,
    required this.socialType,
  });

  toJson() => _$UsersLoginReqToJson(this);

  fromJson(json) => _$UsersLoginReqFromJson(json);

  factory UsersLoginReq.fromEntity(UsersLoginEntity entity) {
    return UsersLoginReq(
      identifier: entity.identifier,
      socialType: entity.socialType,
    );
  }
}
