import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_login_entity.freezed.dart';

@freezed
class UsersLoginEntity with _$UsersLoginEntity {
  factory UsersLoginEntity({
    @Default('') String idToken,
    @Default('') String socialType,
    @Default(false) bool profileStatus,
    @Default(false) bool termsStatus,
  }) = _UsersLoginEntity;
}
