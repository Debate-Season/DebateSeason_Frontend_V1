// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaRes _$MediaResFromJson(Map<String, dynamic> json) => MediaRes(
      mediaMap: (json['mediaMap'] as List<dynamic>)
          .map((e) => MediaItemRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaResToJson(MediaRes instance) => <String, dynamic>{
      'mediaMap': instance.mediaMap,
    };
