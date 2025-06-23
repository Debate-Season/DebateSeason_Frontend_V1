import 'package:debateseason_frontend_v1/features/home/data/models/media/youtube_live_res.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:json_annotation/json_annotation.dart';

part 'youtube_live_container_res.g.dart';

@JsonSerializable()
class YoutubeLiveContainerRes {
  final Map<String, YoutubeLiveRes> youtubeLive;

  YoutubeLiveContainerRes({required this.youtubeLive});

  factory YoutubeLiveContainerRes.fromJson(Map<String, dynamic> json) {
    // final map = json.map((k, e) => MapEntry(
    //       k,
    //       YoutubeLiveRes.fromJson(e as Map<String, dynamic>),
    //     ));

    // final map = <String, YoutubeLiveRes>{};
    //
    // json.forEach((k, e) {
    //   if (e != null && e is Map<String, dynamic>) {
    //     log.d('🔁 Key: $k, Value: $e'); //
    //     map[k] = YoutubeLiveRes.fromJson(e);
    //   } else {
    //     log.w("⚠️ Skipping invalid or null youtubeLive item for key '$k': $e");
    //   }
    // });

    // log.d('📦 YoutubeLiveContainerRes.fromJson() raw json: $json');
    // final raw = json['youtubeLives'] as Map<String, dynamic>;
    // final map = raw.map((k, e) {
    //   log.d('🔁 Key: $k, Value: $e');
    //   return MapEntry(k, YoutubeLiveRes.fromJson(e as Map<String, dynamic>));
    // });

    final map = json.map((k, v) {
      log.d('🎥 [YoutubeLiveContainerRes.fromJson] key=$k, value=$v');
      return MapEntry(k, YoutubeLiveRes.fromJson(v as Map<String, dynamic>));
    });

    return YoutubeLiveContainerRes(youtubeLive: map);
  }

  Map<String, dynamic> toJson() => _$YoutubeLiveContainerResToJson(this);

  List<YoutubeLiveEntity> toEntityList() =>
      youtubeLive.values.map((e) => e.toEntity()).toList();
}
