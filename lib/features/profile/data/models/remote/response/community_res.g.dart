// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityRes _$CommunityResFromJson(Map<String, dynamic> json) => CommunityRes(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
    );

Map<String, dynamic> _$CommunityResToJson(CommunityRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };
