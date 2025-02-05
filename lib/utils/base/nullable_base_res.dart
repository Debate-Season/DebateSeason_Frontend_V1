import 'package:json_annotation/json_annotation.dart';

part 'nullable_base_res.g.dart';

@JsonSerializable()
class NullableBaseRes {
  final int status;
  final String code;
  final String message;

  NullableBaseRes({
    required this.status,
    required this.code,
    required this.message,
  });

  factory NullableBaseRes.fromJson(Map<String, dynamic> json) =>
      _$NullableBaseResFromJson(json);

  Map<String, dynamic> toJson() => _$NullableBaseResToJson(this);
}
