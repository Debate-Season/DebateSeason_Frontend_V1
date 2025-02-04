import 'package:debateseason_frontend_v1/features/chat/data/models/response/chat_room_messages_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
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
}
