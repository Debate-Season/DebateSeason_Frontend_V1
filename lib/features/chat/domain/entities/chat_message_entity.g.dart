// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageEntity _$ChatMessageEntityFromJson(Map<String, dynamic> json) =>
    ChatMessageEntity(
      id: (json['id'] as num).toInt(),
      messageType: ChatMessageType.fromJson(json['messageType'] as String),
      sender: json['sender'] as String,
      content: json['content'] as String,
      opinionType: OpinionType.fromJson(json['opinionType'] as String),
      userCommunity: json['userCommunity'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
    );

Map<String, dynamic> _$ChatMessageEntityToJson(ChatMessageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messageType': ChatMessageType.toJsonUpper(instance.messageType),
      'content': instance.content,
      'sender': instance.sender,
      'opinionType': OpinionType.toJsonUpper(instance.opinionType),
      'userCommunity': instance.userCommunity,
      'timeStamp': instance.timeStamp.toIso8601String(),
    };
