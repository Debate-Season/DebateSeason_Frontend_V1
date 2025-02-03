// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_messages_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomsMessagesRes _$ChatRoomsMessagesResFromJson(
        Map<String, dynamic> json) =>
    ChatRoomsMessagesRes(
      messagesByDates: (json['messagesByDates'] as List<dynamic>)
          .map((e) => MessagesByDates.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$ChatRoomsMessagesResToJson(
        ChatRoomsMessagesRes instance) =>
    <String, dynamic>{
      'messagesByDates': instance.messagesByDates,
      'nextCursor': instance.nextCursor,
    };

MessagesByDates _$MessagesByDatesFromJson(Map<String, dynamic> json) =>
    MessagesByDates(
      date: json['date'] as String,
      chatMessageResponses: (json['chatMessageResponses'] as List<dynamic>)
          .map((e) => ChatMessagesRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$MessagesByDatesToJson(MessagesByDates instance) =>
    <String, dynamic>{
      'date': instance.date,
      'chatMessageResponses': instance.chatMessageResponses,
      'hasMore': instance.hasMore,
      'totalCount': instance.totalCount,
    };
