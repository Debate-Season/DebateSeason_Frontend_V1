import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_entity.freezed.dart';

@freezed
class AppVersionEntity with _$AppVersionEntity {
  factory AppVersionEntity({
    required bool forceUpdate,
    required int versionCode,
  }) = _AppVersionEntity;
}
