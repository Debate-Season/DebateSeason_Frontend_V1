import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_entity.freezed.dart';

@freezed
abstract class TermsEntity with _$TermsEntity {
  factory TermsEntity({
    required int termsId,
    required String termsType,
    required String version,
    required String notionUrl,
  }) = _TermsEntity;
}
