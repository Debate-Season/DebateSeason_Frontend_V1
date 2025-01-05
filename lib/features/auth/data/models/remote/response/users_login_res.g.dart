// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersLoginRes _$UsersLoginResFromJson(Map<String, dynamic> json) =>
    UsersLoginRes(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      socialType: json['socialType'] as String,
      isRegistered: json['isRegistered'] as bool,
    );

Map<String, dynamic> _$UsersLoginResToJson(UsersLoginRes instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'socialType': instance.socialType,
      'isRegistered': instance.isRegistered,
    };
