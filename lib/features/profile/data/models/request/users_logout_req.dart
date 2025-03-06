import 'package:json_annotation/json_annotation.dart';

part 'users_logout_req.g.dart';

@JsonSerializable()
class UsersLogoutReq {
  final String refreshToken;

  const UsersLogoutReq({
    required this.refreshToken,
  });

  factory UsersLogoutReq.fromJson(Map<String, dynamic> json) =>
      _$UsersLogoutReqFromJson(json);

  Map<String, dynamic> toJson() => _$UsersLogoutReqToJson(this);
}
