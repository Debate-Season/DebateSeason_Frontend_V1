// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_new_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgNewRes _$MsgNewResFromJson(Map<String, dynamic> json) => MsgNewRes(
      date: json['date'] as String,
      chatMsgRes: (json['chatMsgRes'] as List<dynamic>)
          .map((e) => ChatMsgRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MsgNewResToJson(MsgNewRes instance) => <String, dynamic>{
      'date': instance.date,
      'chatMsgRes': instance.chatMsgRes,
    };
