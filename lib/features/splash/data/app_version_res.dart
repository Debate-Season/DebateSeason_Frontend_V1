import 'package:debateseason_frontend_v1/features/splash/domain/app_version_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_version_res.g.dart';

@JsonSerializable()
class AppVersionRes {
  final bool forceUpdate;
  final int versionCode;

  AppVersionRes({
    required this.forceUpdate,
    required this.versionCode,
  });

  factory AppVersionRes.fromJson(Map<String, dynamic> json) =>
      _$AppVersionResFromJson(json);

  Map<String, dynamic> toJson() => _$AppVersionResToJson(this);

  toEntity() => AppVersionEntity(
        versionCode: versionCode,
        forceUpdate: forceUpdate,
      );
}
