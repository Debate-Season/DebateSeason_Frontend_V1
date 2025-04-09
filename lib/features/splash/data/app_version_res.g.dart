// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersionRes _$AppVersionResFromJson(Map<String, dynamic> json) =>
    AppVersionRes(
      forceUpdate: json['forceUpdate'] as bool,
      versionCode: (json['versionCode'] as num).toInt(),
    );

Map<String, dynamic> _$AppVersionResToJson(AppVersionRes instance) =>
    <String, dynamic>{
      'forceUpdate': instance.forceUpdate,
      'versionCode': instance.versionCode,
    };
