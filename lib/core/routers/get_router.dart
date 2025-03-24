import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/features/auth/bindings/auth_binding.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/views/auth_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/bindings/chat_binding.dart';
import 'package:debateseason_frontend_v1/features/chat/bindings/debate_binding.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/views/chat_room_screen.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/views/debate_room_screen.dart';
import 'package:debateseason_frontend_v1/features/issue/bindings/issue_binding.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/views/issue_room_screen.dart';
import 'package:debateseason_frontend_v1/features/issuemap/bindings/issuemap_binding.dart';
import 'package:debateseason_frontend_v1/features/issuemap/presentation/views/issuemap_screen.dart';
import 'package:debateseason_frontend_v1/features/main/main_binding.dart';
import 'package:debateseason_frontend_v1/features/main/main_screen.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/profile_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/profile_input_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/terms_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/profile_input_page.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/views/terms_page.dart';
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
      name: GetRouterName.main,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: GetRouterName.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: GetRouterName.terms,
      page: () => TermsPage(),
      binding: TermsBinding(),
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
      name: GetRouterName.issuemap,
      page: () => IssuemapScreen(),
      binding: IssuemapBinding(),
    ),
    GetPage(
      name: GetRouterName.debate,
      page: () => DebateRoomScreen(),
      binding: DebateBinding(),
    ),
  ];
}
