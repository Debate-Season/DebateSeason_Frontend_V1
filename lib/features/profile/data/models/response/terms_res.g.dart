// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsRes _$TermsResFromJson(Map<String, dynamic> json) => TermsRes(
      termsId: (json['termsId'] as num).toInt(),
      termsType: json['termsType'] as String,
      version: json['version'] as String,
      notionUrl: json['notionUrl'] as String,
    );

Map<String, dynamic> _$TermsResToJson(TermsRes instance) => <String, dynamic>{
      'termsId': instance.termsId,
      'termsType': instance.termsType,
      'version': instance.version,
      'notionUrl': instance.notionUrl,
    };
