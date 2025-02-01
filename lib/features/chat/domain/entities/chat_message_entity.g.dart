// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageEntityImpl _$$ChatMessageEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageEntityImpl(
      messageType: json['messageType'] as String,
      content: json['content'] as String,
      sender: json['sender'] as String,
      opinionType: json['opinionType'] as String,
      userCommunity: json['userCommunity'] as String,
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
    );

Map<String, dynamic> _$$ChatMessageEntityImplToJson(
        _$ChatMessageEntityImpl instance) =>
    <String, dynamic>{
      'messageType': instance.messageType,
      'content': instance.content,
      'sender': instance.sender,
      'opinionType': instance.opinionType,
      'userCommunity': instance.userCommunity,
      'timeStamp': instance.timeStamp?.toIso8601String(),
    };
