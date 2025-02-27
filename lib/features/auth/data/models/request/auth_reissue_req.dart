import 'package:json_annotation/json_annotation.dart';

part 'auth_reissue_req.g.dart';

@JsonSerializable()
class AuthReissueReq {
  final String refreshToken;

  AuthReissueReq({
    required this.refreshToken,
  });

  factory AuthReissueReq.fromJson(Map<String, dynamic> json) =>
      _$AuthReissueReqFromJson(json);

  Map<String, dynamic> toJson() => _$AuthReissueReqToJson(this);
}
