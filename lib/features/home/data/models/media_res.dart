import 'package:debateseason_frontend_v1/features/home/data/models/media/media_item_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/media/youtube_live_container_res.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/media_entity.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_res.g.dart';

@JsonSerializable()
class MediaRes {
  @JsonKey(
    name: 'youtubeLiveContainer',
    fromJson: YoutubeLiveContainerRes.fromJson,
    toJson: _youtubeLiveContainerToJson,
  )
  final YoutubeLiveContainerRes? youtubeLiveContainer;

  @JsonKey(name: 'items')
  final List<MediaItemRes>? items;

  MediaRes({
    required this.youtubeLiveContainer,
    required this.items,
  });

  factory MediaRes.fromJson(Map<String, dynamic> json) =>
      _$MediaResFromJson(json);

  Map<String, dynamic> toJson() => _$MediaResToJson(this);

  MediaEntity toEntity() => MediaEntity(
        youtubeLive: youtubeLiveContainer?.toEntityList() ?? [],
        items: items?.map((e) => e.toEntity()).toList() ?? [],
      );
}

Map<String, dynamic>? _youtubeLiveContainerToJson(
    YoutubeLiveContainerRes? instance,
    ) =>
    instance?.toJson();