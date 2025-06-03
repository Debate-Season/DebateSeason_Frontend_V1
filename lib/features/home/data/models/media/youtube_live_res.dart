import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'youtube_live_res.g.dart';

@JsonSerializable()
class YoutubeLiveRes {
  final int id;
  final String title;
  final String supplier;
  final String videoId;
  final String category;
  final DateTime? createAt;
  final String? src;

  YoutubeLiveRes({
    required this.id,
    required this.title,
    required this.supplier,
    required this.videoId,
    required this.category,
    this.createAt,
    this.src,
  });

  factory YoutubeLiveRes.fromJson(Map<String, dynamic> json) =>
      _$YoutubeLiveResFromJson(json);

  Map<String, dynamic> toJson() => _$YoutubeLiveResToJson(this);

  YoutubeLiveEntity toEntity() => YoutubeLiveEntity(
    id: id,
    title: title,
    supplier: supplier,
    videoId: videoId,
    category: category,
    createAt: createAt,
    src: src,
  );
}
