import 'package:json_annotation/json_annotation.dart';

part 'auth_reissue_res.g.dart';

@JsonSerializable()
class AuthReissueRes {
  final String accessToken;
  final String refreshToken;

  AuthReissueRes({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthReissueRes.fromJson(Map<String, dynamic> json) =>
      _$AuthReissueResFromJson(json);

  Map<String, dynamic> toJson() => _$AuthReissueResToJson(this);
}
