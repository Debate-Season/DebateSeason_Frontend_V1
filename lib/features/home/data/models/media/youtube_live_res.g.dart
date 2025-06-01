// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_live_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeLiveRes _$YoutubeLiveResFromJson(Map<String, dynamic> json) =>
    YoutubeLiveRes(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      supplier: json['supplier'] as String,
      videoId: json['videoId'] as String,
      category: json['category'] as String,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      src: json['src'] as String?,
    );

Map<String, dynamic> _$YoutubeLiveResToJson(YoutubeLiveRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'supplier': instance.supplier,
      'videoId': instance.videoId,
      'category': instance.category,
      'createAt': instance.createAt?.toIso8601String(),
      'src': instance.src,
    };
