import 'package:json_annotation/json_annotation.dart';

part 'base_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseRes<T> {
  final int status;
  final String code;
  final String message;
  final T? data;

  BaseRes({
    required this.status,
    required this.code,
    required this.message,
    this.data,
  });

  factory BaseRes.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResToJson(this, toJsonT);
}
