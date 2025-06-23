// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_all_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveAllRes _$LiveAllResFromJson(Map<String, dynamic> json) => LiveAllRes(
      youtubeLives: (json['youtubeLives'] as List<dynamic>)
          .map((e) => YoutubeLiveRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiveAllResToJson(LiveAllRes instance) =>
    <String, dynamic>{
      'youtubeLives': instance.youtubeLives,
    };
