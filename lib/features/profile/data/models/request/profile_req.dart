import 'package:json_annotation/json_annotation.dart';

part 'profile_req.g.dart';

@JsonSerializable()
class ProfileReq {
  String nickname;
  int communityId;
  String gender;
  String ageRange;
  String residenceProvince;
  String residenceDistrict;
  String hometownProvince;
  String hometownDistrict;

  ProfileReq({
    required this.nickname,
    required this.communityId,
    required this.gender,
    required this.ageRange,
    required this.residenceProvince,
    required this.residenceDistrict,
    required this.hometownProvince,
    required this.hometownDistrict,
  });

  factory ProfileReq.fromJson(Map<String, dynamic> json) =>
      _$ProfileReqFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileReqToJson(this);

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
