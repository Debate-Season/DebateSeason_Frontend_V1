import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_reissue_entity.freezed.dart';

@freezed
class AuthReissueEntity with _$AuthReissueEntity {
  factory AuthReissueEntity({
    @Default('') String accessToken,
    required String refreshToken,
  }) = _AuthReissueEntity;
}
