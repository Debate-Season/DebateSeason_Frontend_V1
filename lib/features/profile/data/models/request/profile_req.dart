import 'package:json_annotation/json_annotation.dart';

part 'profile_req.g.dart';

@JsonSerializable()
class ProfileReq {
  String nickname;
  int communityId;
  String gender;
  String ageRange;

  ProfileReq({
    required this.nickname,
    required this.communityId,
    required this.gender,
    required this.ageRange,
  });

  factory ProfileReq.fromJson(Map<String, dynamic> json) =>
      _$ProfileReqFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileReqToJson(this);

  factory ProfileReq.fromEntity(entity) => ProfileReq(
        nickname: entity.nickname,
        communityId: entity.community.id,
        gender: entity.gender,
        ageRange: entity.ageRange,
      );
}
