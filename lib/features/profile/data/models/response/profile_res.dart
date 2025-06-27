import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'community_res.dart';

part 'profile_res.g.dart';

@JsonSerializable()
class ProfileRes {
  String profileImage;
  String nickname;
  String gender;
  String ageRange;
  CommunityRes community;
  String residenceProvince;
  String residenceDistrict;
  String hometownProvince;
  String hometownDistrict;

  ProfileRes({
    required this.profileImage,
    required this.nickname,
    required this.gender,
    required this.ageRange,
    required this.community,
    required this.residenceProvince,
    required this.residenceDistrict,
    required this.hometownProvince,
    required this.hometownDistrict,
  });

  factory ProfileRes.fromJson(Map<String, dynamic> json) =>
      _$ProfileResFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResToJson(this);

  toEntity() => ProfileEntity(
        profileImage: profileImage,
        nickname: nickname,
        gender: gender,
        ageRange: ageRange,
        community: community.toEntity(),
        residenceProvince: residenceProvince,
        residenceDistrict: residenceDistrict,
        hometownProvince: hometownProvince,
        hometownDistrict: hometownDistrict,
      );
}
