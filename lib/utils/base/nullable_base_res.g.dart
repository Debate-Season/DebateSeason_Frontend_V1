// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nullable_base_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NullableBaseRes<T> _$NullableBaseResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NullableBaseRes<T>(
      status: (json['status'] as num).toInt(),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$NullableBaseResToJson<T>(
  NullableBaseRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
