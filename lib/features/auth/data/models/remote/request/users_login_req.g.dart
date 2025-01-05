// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_login_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersLoginReq _$UsersLoginReqFromJson(Map<String, dynamic> json) =>
    UsersLoginReq(
      externalId: json['externalId'] as String,
      socialType: json['socialType'] as String,
      idToken: json['idToken'] as String,
    );

Map<String, dynamic> _$UsersLoginReqToJson(UsersLoginReq instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'socialType': instance.socialType,
      'idToken': instance.idToken,
    };
