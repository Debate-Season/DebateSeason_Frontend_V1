// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_agree_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsAgreeReq _$TermsAgreeReqFromJson(Map<String, dynamic> json) =>
    TermsAgreeReq(
      agreements: (json['agreements'] as List<dynamic>)
          .map((e) => AgreementsReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TermsAgreeReqToJson(TermsAgreeReq instance) =>
    <String, dynamic>{
      'agreements': instance.agreements,
    };

AgreementsReq _$AgreementsReqFromJson(Map<String, dynamic> json) =>
    AgreementsReq(
      termsId: (json['termsId'] as num).toInt(),
      agreed: json['agreed'] as bool,
    );

Map<String, dynamic> _$AgreementsReqToJson(AgreementsReq instance) =>
    <String, dynamic>{
      'termsId': instance.termsId,
      'agreed': instance.agreed,
    };
