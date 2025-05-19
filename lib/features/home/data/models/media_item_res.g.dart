// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItemRes _$MediaItemResFromJson(Map<String, dynamic> json) => MediaItemRes(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      supplier: json['supplier'] as String,
      outdated: DateTime.parse(json['outdated'] as String),
      url: json['url'] as String,
    );

Map<String, dynamic> _$MediaItemResToJson(MediaItemRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'supplier': instance.supplier,
      'outdated': instance.outdated.toIso8601String(),
      'url': instance.url,
    };
