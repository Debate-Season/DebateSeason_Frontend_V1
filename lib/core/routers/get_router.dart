import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/bindings/auth_binding.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/views/auth_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view/chat_room_screen.dart';
import 'package:get/get.dart';

class GetRouter {
  static final getPages = [
    GetPage(
      name: GetRouterName.auth,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: GetRouterName.chat, page: () => ChatRoomScreen()),
  ];
}
