// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersRes _$UsersResFromJson(Map<String, dynamic> json) => UsersRes(
      issueId: (json['issueId'] as num).toInt(),
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
      countChatRoom: (json['countChatRoom'] as num).toInt(),
    );

Map<String, dynamic> _$UsersResToJson(UsersRes instance) => <String, dynamic>{
      'issueId': instance.issueId,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'countChatRoom': instance.countChatRoom,
    };
