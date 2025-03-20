import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_agree_entity.freezed.dart';

@freezed
class TermsAgreeEntity with _$TermsAgreeEntity {
  factory TermsAgreeEntity({
    required int termsId,
    required bool agreed,
  }) = _TermsAgreeEntity;
}