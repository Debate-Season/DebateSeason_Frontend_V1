// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenReq _$FcmTokenReqFromJson(Map<String, dynamic> json) => FcmTokenReq(
      fcmToken: json['fcmToken'] as String,
      deviceId: json['deviceId'] as String,
      deviceType: json['deviceType'] as String,
    );

Map<String, dynamic> _$FcmTokenReqToJson(FcmTokenReq instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'deviceId': instance.deviceId,
      'deviceType': instance.deviceType,
    };
