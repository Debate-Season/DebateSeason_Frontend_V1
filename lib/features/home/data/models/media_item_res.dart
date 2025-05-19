import 'package:debateseason_frontend_v1/features/home/domain/entities/media_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_item_res.g.dart';

@JsonSerializable()
class MediaItemRes {
  final int id;
  final String title;
  final String supplier;
  final DateTime outdated;
  final String url;

  MediaItemRes({
    required this.id,
    required this.title,
    required this.supplier,
    required this.outdated,
    required this.url,
  });

  factory MediaItemRes.fromJson(Map<String, dynamic> json) =>
      _$MediaItemResFromJson(json);

  Map<String, dynamic> toJson() => _$MediaItemResToJson(this);

  MediaItemEntity toEntity() => MediaItemEntity(
        id: id,
        title: title,
        supplier: supplier,
        outdated: outdated,
        url: url,
      );
}
