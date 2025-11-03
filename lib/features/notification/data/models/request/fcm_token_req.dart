import 'package:json_annotation/json_annotation.dart';

part 'fcm_token_req.g.dart';

@JsonSerializable()
class FcmTokenReq {
  final String fcmToken;
  final String deviceId;
  final String deviceType;

  FcmTokenReq({
    required this.fcmToken,
    required this.deviceId,
    required this.deviceType,
  });

  factory FcmTokenReq.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenReqFromJson(json);

  Map<String, dynamic> toJson() => _$FcmTokenReqToJson(this);

  factory FcmTokenReq.fromEntity(entity) => FcmTokenReq(
        fcmToken: entity.fcmToken,
        deviceId: entity.deviceId,
        deviceType: entity.deviceType,
      );
}
