import 'package:json_annotation/json_annotation.dart';

part 'users_login_res.g.dart';

@JsonSerializable()
class UsersLoginRes {
  String accessToken;
  String refreshToken;
  String socialType;
  bool profileStatus;
  bool termsStatus;

  UsersLoginRes({
    required this.accessToken,
    required this.refreshToken,
    required this.socialType,
    required this.profileStatus,
    required this.termsStatus,
  });

  factory UsersLoginRes.fromJson(Map<String, dynamic> json) =>
      _$UsersLoginResFromJson(json);

  Map<String, dynamic> toJson() => _$UsersLoginResToJson(this);
}
