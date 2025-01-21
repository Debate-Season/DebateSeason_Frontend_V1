import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/bindings/auth_binding.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/views/auth_screen.dart';
import 'package:debateseason_frontend_v1/features/category/bindings/category_binding.dart';
import 'package:debateseason_frontend_v1/features/category/presentation/views/category_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/bindings/chat_binding.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/bindings/debate_binding.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view/chat_room_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view/debate_room_screen.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/bindings/issue_binding.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view/issue_room_screen.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/profile_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/profile_input_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/profile_input_page.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/profile_screen.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/profile_withdraw_page.dart';
import 'package:debateseason_frontend_v1/features/splash/splash_screen.dart';
import 'package:get/get.dart';

class GetRouter {
  static final getPages = [
    GetPage(
      name: GetRouterName.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: GetRouterName.auth,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: GetRouterName.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: GetRouterName.profileInput,
      page: () => ProfileInputPage(),
      binding: ProfileInputBinding(),
    ),
    GetPage(
      name: GetRouterName.profileWithdraw,
      page: () => ProfileWithdrawPage(),
    ),
    GetPage(
      name: GetRouterName.chat,
      page: () => ChatRoomScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: GetRouterName.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: GetRouterName.issue,
      page: () => IssueRoomScreen(),
      binding: IssueBinding(),
    ),
    GetPage(
      name: GetRouterName.home,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: GetRouterName.debate,
      page: () => DebateRoomScreen(),
      binding: DebateBinding(),
    ),
  ];
}
