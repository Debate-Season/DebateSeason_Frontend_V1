import 'package:json_annotation/json_annotation.dart';

import 'chat_messages_res.dart';

part 'chat_room_messages_res.g.dart';

@JsonSerializable()
class ChatRoomsMessagesRes {
  final List<MessagesByDates> messagesByDates;
  final String nextCursor;

  ChatRoomsMessagesRes({
    required this.messagesByDates,
    required this.nextCursor,
  });

  factory ChatRoomsMessagesRes.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomsMessagesResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomsMessagesResToJson(this);
}

@JsonSerializable()
class MessagesByDates {
  final String date;
  final List<ChatMessagesRes> chatMessageResponses;
  final bool hasMore;
  final int totalCount;

  MessagesByDates({
    required this.date,
    required this.chatMessageResponses,
    required this.hasMore,
    required this.totalCount,
  });

  factory MessagesByDates.fromJson(Map<String, dynamic> json) =>
      _$MessagesByDatesFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesByDatesToJson(this);
}
