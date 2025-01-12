// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRes _$ProfileResFromJson(Map<String, dynamic> json) => ProfileRes(
      nickname: json['nickname'] as String,
      communityId: (json['communityId'] as num).toInt(),
      gender: json['gender'] as String,
      ageRange: json['ageRange'] as String,
    );

Map<String, dynamic> _$ProfileResToJson(ProfileRes instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'communityId': instance.communityId,
      'gender': instance.gender,
      'ageRange': instance.ageRange,
    };
