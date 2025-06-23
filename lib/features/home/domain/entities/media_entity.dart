import 'package:debateseason_frontend_v1/features/home/domain/entities/media_item_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/youtube_live_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_entity.freezed.dart';

@freezed
class MediaEntity with _$MediaEntity {
  factory MediaEntity({
    required List<YoutubeLiveEntity> youtubeLive,
    required List<MediaItemEntity> items,
  }) = _MediaEntity;
}
