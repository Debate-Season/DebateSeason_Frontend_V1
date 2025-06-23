// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomRes _$ChatRoomResFromJson(Map<String, dynamic> json) => ChatRoomRes(
      chatRoomId: (json['chatRoomId'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      agree: (json['agree'] as num).toInt(),
      disagree: (json['disagree'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      opinion: json['opinion'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$ChatRoomResToJson(ChatRoomRes instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'title': instance.title,
      'content': instance.content,
      'agree': instance.agree,
      'disagree': instance.disagree,
      'createdAt': instance.createdAt,
      'opinion': instance.opinion,
      'time': instance.time,
    };
