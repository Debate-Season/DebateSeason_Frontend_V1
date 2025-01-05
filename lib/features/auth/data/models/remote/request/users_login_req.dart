import 'package:json_annotation/json_annotation.dart';

part 'users_login_req.g.dart';

@JsonSerializable()
class UsersLoginReq {
  String externalId;
  String socialType;
  String idToken;

  UsersLoginReq({
    required this.externalId,
    required this.socialType,
    required this.idToken,
  });

  toJson() => _$UsersLoginReqToJson(this);

  fromJson(json) => _$UsersLoginReqFromJson(json);
}
