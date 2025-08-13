// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_my_agree_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsMyAgreeRes _$TermsMyAgreeResFromJson(Map<String, dynamic> json) =>
    TermsMyAgreeRes(
      termsType: json['termsType'] as String,
      agreedAt: json['agreedAt'] as String,
      notionUrl: json['notionUrl'] as String,
    );

Map<String, dynamic> _$TermsMyAgreeResToJson(TermsMyAgreeRes instance) =>
    <String, dynamic>{
      'termsType': instance.termsType,
      'agreedAt': instance.agreedAt,
      'notionUrl': instance.notionUrl,
    };
