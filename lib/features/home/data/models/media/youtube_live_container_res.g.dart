// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_live_container_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeLiveContainerRes _$YoutubeLiveContainerResFromJson(
        Map<String, dynamic> json) =>
    YoutubeLiveContainerRes(
      youtubeLive:
          YoutubeLiveRes.fromJson(json['news'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YoutubeLiveContainerResToJson(
        YoutubeLiveContainerRes instance) =>
    <String, dynamic>{
      'news': instance.youtubeLive,
    };
