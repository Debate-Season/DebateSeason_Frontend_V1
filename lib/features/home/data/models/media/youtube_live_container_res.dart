import 'package:debateseason_frontend_v1/features/home/data/models/media/youtube_live_res.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'youtube_live_container_res.g.dart';

@JsonSerializable()
class YoutubeLiveContainerRes {
  @JsonKey(name: 'news')
  final YoutubeLiveRes youtubeLive;

  YoutubeLiveContainerRes({required this.youtubeLive});

  factory YoutubeLiveContainerRes.fromJson(Map<String, dynamic> json) =>
      _$YoutubeLiveContainerResFromJson(json);

  Map<String, dynamic> toJson() => _$YoutubeLiveContainerResToJson(this);

  YoutubeLiveEntity toEntity() => youtubeLive.toEntity();
}
