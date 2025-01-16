import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/chat/data/data_sources/room_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/debate_room_view_model.dart';
import 'package:get/get.dart';

class DebateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DebateRoomViewModel());
    Get.lazyPut<RoomDataSource>(() => RoomDataSource(DioClient().dio));
  }
}
