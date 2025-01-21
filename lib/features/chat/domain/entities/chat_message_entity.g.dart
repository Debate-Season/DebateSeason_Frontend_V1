// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageEntityImpl _$$ChatMessageEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageEntityImpl(
      messageType: json['message_type'] as String,
      content: json['content'] as String,
      sender: json['sender'] as String,
      opinionType: json['opinion_type'] as String,
      userCommunity: json['user_community'] as String,
    );

Map<String, dynamic> _$$ChatMessageEntityImplToJson(
        _$ChatMessageEntityImpl instance) =>
    <String, dynamic>{
      'message_type': instance.messageType,
      'content': instance.content,
      'sender': instance.sender,
      'opinion_type': instance.opinionType,
      'user_community': instance.userCommunity,
    };
