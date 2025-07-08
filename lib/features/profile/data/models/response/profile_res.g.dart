// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRes _$ProfileResFromJson(Map<String, dynamic> json) => ProfileRes(
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      ageRange: json['ageRange'] as String,
      community:
          CommunityRes.fromJson(json['community'] as Map<String, dynamic>),
      residenceProvince: json['residenceProvince'] as String,
      residenceDistrict: json['residenceDistrict'] as String,
      hometownProvince: json['hometownProvince'] as String,
      hometownDistrict: json['hometownDistrict'] as String,
    );

Map<String, dynamic> _$ProfileResToJson(ProfileRes instance) =>
    <String, dynamic>{
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'ageRange': instance.ageRange,
      'community': instance.community,
      'residenceProvince': instance.residenceProvince,
      'residenceDistrict': instance.residenceDistrict,
      'hometownProvince': instance.hometownProvince,
      'hometownDistrict': instance.hometownDistrict,
    };
