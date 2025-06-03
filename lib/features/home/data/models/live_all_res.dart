import 'package:debateseason_frontend_v1/features/home/data/models/media/youtube_live_res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'live_all_res.g.dart';

@JsonSerializable()
class LiveAllRes {
  final List<YoutubeLiveRes> youtubeLives;

  LiveAllRes({
    required this.youtubeLives,
  });

  factory LiveAllRes.fromJson(Map<String, dynamic> json) =>
      LiveAllRes(
        youtubeLives: (json['youtubeLives'] as List)
            .map((e) => YoutubeLiveRes.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => _$LiveAllResToJson(this);
}
