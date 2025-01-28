// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_msg_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMsgRes _$ChatMsgResFromJson(Map<String, dynamic> json) => ChatMsgRes(
      id: (json['id'] as num).toInt(),
      messageType: json['messageType'] as String,
      sender: json['sender'] as String,
      content: json['content'] as String,
      opinionType: json['opinionType'] as String,
      userCommunity: json['userCommunity'] as String,
      timeStamp: ChatMsgRes._dateTimeFromJson(json['timeStamp'] as List),
    );

Map<String, dynamic> _$ChatMsgResToJson(ChatMsgRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messageType': instance.messageType,
      'sender': instance.sender,
      'content': instance.content,
      'opinionType': instance.opinionType,
      'userCommunity': instance.userCommunity,
      'timeStamp': ChatMsgRes._dateTimeToJson(instance.timeStamp),
    };
