import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';
import 'package:get/get.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoomViewModel());
  }
}
