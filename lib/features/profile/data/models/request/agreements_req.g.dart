// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreements_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
