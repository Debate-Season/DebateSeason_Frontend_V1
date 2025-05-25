// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_chat_room_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestChatRoomRes _$BestChatRoomResFromJson(Map<String, dynamic> json) =>
    BestChatRoomRes(
      issueId: (json['issueId'] as num).toInt(),
      issueTitle: json['issueTitle'] as String,
      debateId: (json['debateId'] as num).toInt(),
      debateTitle: json['debateTitle'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$BestChatRoomResToJson(BestChatRoomRes instance) =>
    <String, dynamic>{
      'issueId': instance.issueId,
      'issueTitle': instance.issueTitle,
      'debateId': instance.debateId,
      'debateTitle': instance.debateTitle,
      'time': instance.time,
    };
