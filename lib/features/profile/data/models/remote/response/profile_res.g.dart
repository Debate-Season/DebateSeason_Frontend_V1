// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRes _$ProfileResFromJson(Map<String, dynamic> json) => ProfileRes(
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      ageRange: json['ageRange'] as String,
      community:
          CommunityRes.fromJson(json['community'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResToJson(ProfileRes instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'gender': instance.gender,
      'ageRange': instance.ageRange,
      'community': instance.community,
    };
