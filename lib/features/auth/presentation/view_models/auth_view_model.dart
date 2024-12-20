import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class AuthViewModel extends GetxController {
  final String kakaoLoginType = 'kakao';
  final String appleLoginType = 'apple';

  @override
  void onInit() {
    super.onInit();

    _kakaoSdkInit();
  }

  void _kakaoSdkInit() {
    KakaoSdk.init(
      nativeAppKey: dotenv.get('KAKAO_APP_KEY'),
      loggingEnabled: true,
    );
  }

  Future<bool> kakaoLogin() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
         await UserApi.instance.loginWithKakaoAccount();
      }

      User user = await UserApi.instance.me();

      log.d(user.id);

      return true;
    } catch (e) {
      log.d('카카오 로그인 실패 $e');
      return false;
    }
  }

  Future<bool> kakaoLogout() async {
    try {
      await UserApi.instance.unlink();
      log.d('카카오톡 로그아웃 성공');
      return true;
    } catch (e) {
      return false;
    }
  }
}
