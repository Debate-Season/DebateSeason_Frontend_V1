// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomResImpl _$$RoomResImplFromJson(Map<String, dynamic> json) =>
    _$RoomResImpl(
      chatRoomId: (json['chatRoomId'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      agree: (json['agree'] as num).toInt(),
      disagree: (json['disagree'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      opinion: json['opinion'] as String,
    );

Map<String, dynamic> _$$RoomResImplToJson(_$RoomResImpl instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'title': instance.title,
      'content': instance.content,
      'agree': instance.agree,
      'disagree': instance.disagree,
      'createdAt': instance.createdAt,
      'opinion': instance.opinion,
    };
