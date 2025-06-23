// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaRes _$MediaResFromJson(Map<String, dynamic> json) => MediaRes(
      youtubeLiveContainer: YoutubeLiveContainerRes.fromJson(
          json['youtubeLiveContainer'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MediaItemRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaResToJson(MediaRes instance) => <String, dynamic>{
      'youtubeLiveContainer':
          _youtubeLiveContainerToJson(instance.youtubeLiveContainer),
      'items': instance.items,
    };
