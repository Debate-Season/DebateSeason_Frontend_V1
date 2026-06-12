import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_my_agree_entity.freezed.dart';

@freezed
abstract class TermsMyAgreeEntity with _$TermsMyAgreeEntity {
  factory TermsMyAgreeEntity({
    required String termsType,
    required String agreedAt,
    required String notionUrl,
  }) = _TermsMyAgreeEntity;
}
