import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'room_data_source.g.dart';

@RestApi()
abstract class RoomDataSource {
  factory RoomDataSource(Dio dio) = _RoomDataSource;

  @GET('/api/v1/room')
  Future<BaseRes<RoomRes>> getRoom({
    @Query('chatroom-id') required int chatroomId,
  });
}
