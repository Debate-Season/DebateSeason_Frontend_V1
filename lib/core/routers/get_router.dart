import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/bindings/auth_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/bindings/profile_input_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/profile_input_page.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/views/auth_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/bindings/chat_binding.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view/chat_room_screen.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/bindings/profile_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/profile_screen.dart';
import 'package:get/get.dart';

class GetRouter {
  static final getPages = [
    GetPage(
      name: GetRouterName.auth,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: GetRouterName.chat,
      page: () => ChatRoomScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: GetRouterName.profileInput,
      page: () => ProfileInputPage(),
      binding: ProfileInputBinding(),
    ),
    GetPage(
      name: GetRouterName.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
