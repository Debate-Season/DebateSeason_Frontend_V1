import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'community_res.dart';

part 'profile_res.g.dart';

@JsonSerializable()
class ProfileRes {
  String nickname;
  String gender;
  String ageRange;
  CommunityRes community;

  ProfileRes({
    required this.nickname,
    required this.gender,
    required this.ageRange,
    required this.community,
  });

  factory ProfileRes.fromJson(Map<String, dynamic> json) =>
      _$ProfileResFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResToJson(this);

  toEntity() => ProfileEntity(
        nickname: nickname,
        gender: gender,
        ageRange: ageRange,
        community: community.toEntity(),
      );
}
