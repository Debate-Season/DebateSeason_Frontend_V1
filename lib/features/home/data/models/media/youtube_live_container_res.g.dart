// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_live_container_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeLiveContainerRes _$YoutubeLiveContainerResFromJson(
        Map<String, dynamic> json) =>
    YoutubeLiveContainerRes(
      youtubeLive: (json['youtubeLive'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, YoutubeLiveRes.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$YoutubeLiveContainerResToJson(
        YoutubeLiveContainerRes instance) =>
    <String, dynamic>{
      'youtubeLive': instance.youtubeLive,
    };
