// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomRes _$RoomResFromJson(Map<String, dynamic> json) => _RoomRes(
  chatRoomId: (json['chatRoomId'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String,
  agree: (json['agree'] as num).toInt(),
  disagree: (json['disagree'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  opinion: OpinionType.fromJson(json['opinion'] as String),
);

Map<String, dynamic> _$RoomResToJson(_RoomRes instance) => <String, dynamic>{
  'chatRoomId': instance.chatRoomId,
  'title': instance.title,
  'content': instance.content,
  'agree': instance.agree,
  'disagree': instance.disagree,
  'createdAt': instance.createdAt.toIso8601String(),
  'opinion': _$OpinionTypeEnumMap[instance.opinion]!,
};

const _$OpinionTypeEnumMap = {
  OpinionType.agree: 'agree',
  OpinionType.disagree: 'disagree',
  OpinionType.neutral: 'neutral',
};
