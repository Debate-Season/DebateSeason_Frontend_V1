// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_login_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersLoginReq _$UsersLoginReqFromJson(Map<String, dynamic> json) =>
    UsersLoginReq(
      idToken: json['idToken'] as String,
      socialType: json['socialType'] as String,
    );

Map<String, dynamic> _$UsersLoginReqToJson(UsersLoginReq instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'socialType': instance.socialType,
    };
