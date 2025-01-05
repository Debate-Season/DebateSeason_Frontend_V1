import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_login_entity.freezed.dart';

@freezed
class UsersLoginEntity with _$UsersLoginEntity {
  factory UsersLoginEntity({
    required String externalId,
    required String socialType,
    required String idToken,
  }) = _UsersLoginEntity;
}
