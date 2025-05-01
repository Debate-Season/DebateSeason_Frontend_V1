import 'package:debateseason_frontend_v1/features/chat/data/models/report_reason_req.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_rooms_messages_data_source.g.dart';

@RestApi()
abstract class ChatRoomsMessagesDataSource {
  factory ChatRoomsMessagesDataSource(Dio dio) = _ChatRoomsMessagesDataSource;

  @GET('/api/v1/chat/rooms/{roomId}/messages')
  Future<BaseRes<ChatRoomsMessagesRes>> getChatRoomsMessages({
    @Path('roomId') required int roomId,
    @Query('cursor') int? cursor,
  });

  @POST('/api/v1/chat/messages/{messageId}/report')
  Future<BaseRes> reportMessage({
    @Path() required int messageId,
    @Body() required ReportReasonReq body,
  });
}

// 내부적으로 사용되지 않는 일회용 클래스이므로 data_source 에 정의함.
@JsonSerializable()
class ChatRoomsMessagesRes {
  final List<ChatMessageEntity> items;
  @JsonKey(fromJson: _stringToInt)
  final int nextCursor;
  final bool hasMore;
  final int totalCount;

  ChatRoomsMessagesRes({
    required this.items,
    required this.nextCursor,
    required this.hasMore,
    required this.totalCount,
  });

  factory ChatRoomsMessagesRes.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomsMessagesResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomsMessagesResToJson(this);

  static int _stringToInt(dynamic value) => int.tryParse(value.toString()) ?? 0;
}
