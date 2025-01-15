import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:get/get.dart';

class SplashViewmodel extends GetxController {
  final _storage = SecureStorageService();
  final _pref = SharedPreferencesService();

  Future<void> autoLogin() async {
    final String accessToken = await _storage.getAccessToken();
    final bool profileStatus = _pref.getProfileStatus();

    if (accessToken.isNotEmpty) {
      if (profileStatus) {
        Get.offAllNamed(GetRouterName.home);
      } else {
        Get.offAllNamed(GetRouterName.profileInput);
      }
    } else {
      Get.offAllNamed(GetRouterName.auth);
    }
  }
}
