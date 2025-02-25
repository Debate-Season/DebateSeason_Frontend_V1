import 'package:debateseason_frontend_v1/features/chat/data/models/chat_message_model.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_rooms_messages_data_source.g.dart';

@RestApi()
abstract class ChatRoomsMessagesDataSource {
  factory ChatRoomsMessagesDataSource(Dio dio) = _ChatRoomsMessagesDataSource;

  @GET('/api/v1/chat/rooms/{roomId}/messages')
  Future<BaseRes<ChatRoomsMessagesRes>> getRawChatRoomsMessages({
    @Path('roomId') required int roomId,
    @Query('cursor') int? cursor,
  });
}

// 내부적으로 사용되지 않는 일회용 클래스이므로 data_source 에 정의함.
@JsonSerializable()
class ChatRoomsMessagesRes {
  final List<MessagesByDates> messagesByDates;
  final String? nextCursor;
  final bool hasMore;

  ChatRoomsMessagesRes({
    required this.messagesByDates,
    required this.nextCursor,
    required this.hasMore,
  });

  factory ChatRoomsMessagesRes.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomsMessagesResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomsMessagesResToJson(this);
}

// 내부적으로 사용되지 않는 일회용 클래스이므로 data_source 에 정의함.
@JsonSerializable()
class MessagesByDates {
  final String date;
  final List<ChatMessageModel> chatMessageResponses;
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
