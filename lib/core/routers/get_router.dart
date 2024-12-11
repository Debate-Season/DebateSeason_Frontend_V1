import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/views/login_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view/chat_room_screen.dart';
import 'package:get/get.dart';

class GetRouter {
  static final getPages = [
    GetPage(name: GetRouterName.login, page: () => LoginScreen()),
    GetPage(name: GetRouterName.chat, page: () => ChatRoomScreen()),
  ];
}
