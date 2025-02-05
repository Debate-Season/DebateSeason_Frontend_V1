// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_reissue_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthReissueRes _$AuthReissueResFromJson(Map<String, dynamic> json) =>
    AuthReissueRes(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthReissueResToJson(AuthReissueRes instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
