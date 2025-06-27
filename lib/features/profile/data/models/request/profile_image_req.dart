import 'package:json_annotation/json_annotation.dart';

part 'profile_image_req.g.dart';

@JsonSerializable()
class ProfileImageReq {
  String profileImage;

  ProfileImageReq({
    required this.profileImage,
  });

  factory ProfileImageReq.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageReqFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileImageReqToJson(this);

  factory ProfileImageReq.fromEntity(entity) => ProfileImageReq(
        profileImage: entity.nickname,
      );
}
