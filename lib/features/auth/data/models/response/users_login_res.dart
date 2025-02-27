import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_login_res.g.dart';

@JsonSerializable()
class UsersLoginRes {
  String accessToken;
  String refreshToken;
  String socialType;
  bool profileStatus;

  UsersLoginRes({
    required this.accessToken,
    required this.refreshToken,
    required this.socialType,
    required this.profileStatus,
  });

  factory UsersLoginRes.fromJson(Map<String, dynamic> json) =>
      _$UsersLoginResFromJson(json);

  Map<String, dynamic> toJson() => _$UsersLoginResToJson(this);

  toEntity() => UsersLoginEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        socialType: socialType,
        profileStatus: profileStatus,
      );
}
