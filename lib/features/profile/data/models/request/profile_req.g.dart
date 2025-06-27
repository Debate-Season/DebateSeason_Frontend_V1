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
      residenceProvince: json['residenceProvince'] as String,
      residenceDistrict: json['residenceDistrict'] as String,
      hometownProvince: json['hometownProvince'] as String,
      hometownDistrict: json['hometownDistrict'] as String,
    );

Map<String, dynamic> _$ProfileReqToJson(ProfileReq instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'communityId': instance.communityId,
      'gender': instance.gender,
      'ageRange': instance.ageRange,
      'residenceProvince': instance.residenceProvince,
      'residenceDistrict': instance.residenceDistrict,
      'hometownProvince': instance.hometownProvince,
      'hometownDistrict': instance.hometownDistrict,
    };
