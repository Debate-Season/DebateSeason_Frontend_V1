// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgRes _$MsgResFromJson(Map<String, dynamic> json) => MsgRes(
      roomId: (json['roomId'] as num).toInt(),
      type: json['type'] as String,
      content: json['content'] as String,
      sender: json['sender'] as String,
      opinionType: json['opinionType'] as String,
      userCommunity: json['userCommunity'] as String,
      timeStamp: json['timeStamp'] as String,
    );

Map<String, dynamic> _$MsgResToJson(MsgRes instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'type': instance.type,
      'content': instance.content,
      'sender': instance.sender,
      'opinionType': instance.opinionType,
      'userCommunity': instance.userCommunity,
      'timeStamp': instance.timeStamp,
    };
