// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileReq _$ProfileReqFromJson(Map<String, dynamic> json) => ProfileReq(
      nickname: json['nickname'] as String,
      communityId: (json['communityId'] as num).toInt(),
      gender: json['gender'] as String,
      ageRange: json['ageRange'] as String,
    );

Map<String, dynamic> _$ProfileReqToJson(ProfileReq instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'communityId': instance.communityId,
      'gender': instance.gender,
      'ageRange': instance.ageRange,
    };
