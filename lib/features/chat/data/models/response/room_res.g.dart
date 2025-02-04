// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomRes _$RoomResFromJson(Map<String, dynamic> json) => RoomRes(
      chatRoomId: (json['chatRoomId'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      agree: (json['agree'] as num).toInt(),
      disagree: (json['disagree'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      opinion: $enumDecode(_$OpinionTypeEnumMap, json['opinion']),
    );

Map<String, dynamic> _$RoomResToJson(RoomRes instance) => <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'title': instance.title,
      'content': instance.content,
      'agree': instance.agree,
      'disagree': instance.disagree,
      'createdAt': instance.createdAt,
      'opinion': _$OpinionTypeEnumMap[instance.opinion]!,
    };

const _$OpinionTypeEnumMap = {
  OpinionType.agree: 'agree',
  OpinionType.disagree: 'disagree',
  OpinionType.neutral: 'neutral',
};
