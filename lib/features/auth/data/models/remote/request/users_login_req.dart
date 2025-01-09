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
}
