import 'package:debateseason_frontend_v1/features/home/data/models/media/media_item_res.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_res.g.dart';

@JsonSerializable()
class MediaRes {
  // @JsonKey(defaultValue: [])
  final List<MediaItemRes> mediaMap;

  MediaRes({
    required this.mediaMap,
  });

  factory MediaRes.fromJson(Map<String, dynamic> json) =>
      _$MediaResFromJson(json);

  Map<String, dynamic> toJson() => _$MediaResToJson(this);

  MediaEntity toEntity() => MediaEntity(
        mediaMap: mediaMap.map((e) => e.toEntity()).toList(),
      );
}
