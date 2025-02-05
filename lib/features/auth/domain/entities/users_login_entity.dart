import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_login_entity.freezed.dart';

@freezed
class UsersLoginEntity with _$UsersLoginEntity {
  factory UsersLoginEntity({
    @Default('') String identifier,
    @Default('') String socialType,
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default(false) bool profileStatus,
    @Default(500) int statusCode,
  }) = _UsersLoginEntity;
}
