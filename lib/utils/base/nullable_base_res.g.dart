// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nullable_base_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NullableBaseRes _$NullableBaseResFromJson(Map<String, dynamic> json) =>
    NullableBaseRes(
      status: (json['status'] as num).toInt(),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$NullableBaseResToJson(NullableBaseRes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
