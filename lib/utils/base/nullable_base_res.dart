import 'package:json_annotation/json_annotation.dart';

part 'nullable_base_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NullableBaseRes<T> {
  final int status;
  final String code;
  final String message;

  NullableBaseRes({
    required this.status,
    required this.code,
    required this.message,
  });

  factory NullableBaseRes.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$NullableBaseResFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$NullableBaseResToJson(this, toJsonT);
}
