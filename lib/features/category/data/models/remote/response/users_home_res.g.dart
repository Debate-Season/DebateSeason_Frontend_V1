// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_home_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersHomeRes _$UsersHomeResFromJson(Map<String, dynamic> json) => UsersHomeRes(
      issueId: (json['issueId'] as num).toInt(),
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      countChatRoom: (json['countChatRoom'] as num).toInt(),
    );

Map<String, dynamic> _$UsersHomeResToJson(UsersHomeRes instance) =>
    <String, dynamic>{
      'issueId': instance.issueId,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'countChatRoom': instance.countChatRoom,
    };
