// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_response_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomResponseRes _$ChatRoomResponseResFromJson(Map<String, dynamic> json) =>
    ChatRoomResponseRes(
      chatRoomId: (json['chatRoomId'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      agree: (json['agree'] as num).toInt(),
      disagree: (json['disagree'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      opinion: OpinionType.fromJson(json['opinion'] as String),
    );

Map<String, dynamic> _$ChatRoomResponseResToJson(
        ChatRoomResponseRes instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'title': instance.title,
      'content': instance.content,
      'agree': instance.agree,
      'disagree': instance.disagree,
      'createdAt': instance.createdAt.toIso8601String(),
      'opinion': OpinionType.toJsonUpper(instance.opinion),
    };
