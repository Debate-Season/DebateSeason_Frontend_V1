import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_res.g.dart';

@JsonSerializable()
class CommunityRes {
  int id;
  String name;
  String iconUrl;

  CommunityRes({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  factory CommunityRes.fromJson(Map<String, dynamic> json) =>
      _$CommunityResFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityResToJson(this);

  CommunityEntity toEntity() => CommunityEntity(
        id: id,
        name: name,
        iconUrl: iconUrl,
      );
}
