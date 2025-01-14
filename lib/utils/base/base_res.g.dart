// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRes<T> _$BaseResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseRes<T>(
      status: (json['status'] as num).toInt(),
      code: json['code'] as String,
      message: json['message'] as String,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$BaseResToJson<T>(
  BaseRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': toJsonT(instance.data),
    };
