import 'package:json_annotation/json_annotation.dart';

part 'app_versions_response.g.dart';

@JsonSerializable()
class AppVersionsResponse {
  final bool forceUpdate;

  AppVersionsResponse({
    required this.forceUpdate,
  });

  factory AppVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$AppVersionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppVersionsResponseToJson(this);
}
