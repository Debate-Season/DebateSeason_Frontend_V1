// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessagesRes _$ChatMessagesResFromJson(Map<String, dynamic> json) =>
    ChatMessagesRes(
      id: (json['id'] as num).toInt(),
      messageType: json['messageType'] as String,
      sender: json['sender'] as String,
      content: json['content'] as String,
      opinionType: json['opinionType'] as String,
      userCommunity: json['userCommunity'] as String,
      timeStamp: json['timeStamp'] as String,
    );

Map<String, dynamic> _$ChatMessagesResToJson(ChatMessagesRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messageType': instance.messageType,
      'sender': instance.sender,
      'content': instance.content,
      'opinionType': instance.opinionType,
      'userCommunity': instance.userCommunity,
      'timeStamp': instance.timeStamp,
    };
