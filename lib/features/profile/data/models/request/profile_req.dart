import 'package:json_annotation/json_annotation.dart';

part 'profile_req.g.dart';

@JsonSerializable()
class ProfileReq {
  String nickname;
  int communityId;
  String gender;
  String ageRange;
  String? residenceProvince;
  String? residenceDistrict;
  String? hometownProvince;
  String? hometownDistrict;

  ProfileReq({
    required this.nickname,
    required this.communityId,
    required this.gender,
    required this.ageRange,
    this.residenceProvince,
    this.residenceDistrict,
    this.hometownProvince,
    this.hometownDistrict,
  });

  factory ProfileReq.fromJson(Map<String, dynamic> json) =>
      _$ProfileReqFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileReqToJson(this);

  /// POST /profiles - only sends required parameters (excludes nulls and empty strings)
  Map<String, dynamic> toJsonForPost() {
    final json = _$ProfileReqToJson(this);
    json.removeWhere((key, value) => value == null || value == '');
    return json;
  }

  /// PATCH /profiles - sends all parameters with empty strings instead of nulls
  Map<String, dynamic> toJsonForPatch() {
    final json = _$ProfileReqToJson(this);
    json.forEach((key, value) {
      if (value == null) {
        json[key] = '';
      }
    });
    return json;
  }

  factory ProfileReq.fromEntity(entity) => ProfileReq(
        nickname: entity.nickname,
        communityId: entity.community.id,
        gender: entity.gender,
        ageRange: entity.ageRange,
        residenceProvince: entity.residenceProvince,
        residenceDistrict: entity.residenceDistrict,
        hometownProvince: entity.hometownProvince,
        hometownDistrict: entity.hometownDistrict,
      );
}
