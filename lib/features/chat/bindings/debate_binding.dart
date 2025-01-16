import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/debate_room_view_model.dart';
import 'package:get/get.dart';

class DebateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DebateRoomViewModel());
  }
}
