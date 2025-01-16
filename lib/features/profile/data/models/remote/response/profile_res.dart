import 'package:json_annotation/json_annotation.dart';

part 'profile_res.g.dart';

@JsonSerializable()
class ProfileRes {
  String nickname;
  int communityId;
  String gender;
  String ageRange;

  ProfileRes({
    required this.nickname,
    required this.communityId,
    required this.gender,
    required this.ageRange,
  });

  factory ProfileRes.fromJson(Map<String, dynamic> json) =>
      _$ProfileResFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResToJson(this);
}
