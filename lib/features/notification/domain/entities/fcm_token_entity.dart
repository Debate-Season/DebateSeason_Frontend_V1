import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token_entity.freezed.dart';

@freezed
class FcmTokenEntity with _$FcmTokenEntity {
  factory FcmTokenEntity({
    required String fcmToken,
    required String deviceId,
    required String deviceType,
  }) = _FcmTokenEntity;
}
