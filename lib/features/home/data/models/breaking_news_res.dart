import 'package:debateseason_frontend_v1/features/home/domain/entities/breaking_news_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breaking_news_res.g.dart';

@JsonSerializable()
class BreakingNewsRes {
  final String title;
  final String url;

  BreakingNewsRes({
    required this.title,
    required this.url,
  });

  factory BreakingNewsRes.fromJson(Map<String, dynamic> json) =>
      _$BreakingNewsResFromJson(json);

  Map<String, dynamic> toJson() => _$BreakingNewsResToJson(this);

  BreakingNewsEntity toEntity() => BreakingNewsEntity(title: title, url: url);
}
