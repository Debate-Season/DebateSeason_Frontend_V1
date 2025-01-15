import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/users_login_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthViewModel extends GetxController {
  late final SecureStoreService _storage = SecureStoreService();
  late final UsersLoginRepository _usersLoginRepository;
  final _pref = SharedPreferencesService();
  final String kakaoLoginType = 'kakao';
  final String appleLoginType = 'apple';

  @override
  void onInit() {
    super.onInit();

    _usersLoginRepository = Get.find<UsersLoginRepository>();
    _kakaoSdkInit();
  }

  void _kakaoSdkInit() {
    KakaoSdk.init(
      nativeAppKey: dotenv.get('KAKAO_APP_KEY'),
      loggingEnabled: true,
    );
  }

  Future<UiState<UsersLoginEntity>> kakaoLogin() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }

      User user = await UserApi.instance.me();

      final usersLoginEntity = await postUsersLogin(
        identifier: user.id.toString(),
        socialType: kakaoLoginType,
      );

      await Future.wait([
        _storage.setAccessToken(accessToken: usersLoginEntity.accessToken),
        _storage.setRefreshToken(refreshToken: usersLoginEntity.refreshToken),
        _pref.setSocialType(socialType: kakaoLoginType),
      ]);

      return UiState.success(usersLoginEntity);
    } catch (e) {
      log.d('카카오 로그인 실패\n$e');
      return UiState.failure('카카오 로그인에 실패했습니다.');
    }
  }

  Future<UiState<UsersLoginEntity>> appleLogin() async {
    try {
      final user = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);

      final usersLoginEntity = await postUsersLogin(
        identifier: user.userIdentifier.toString(),
        socialType: appleLoginType,
      );

      await Future.wait([
        _storage.setAccessToken(accessToken: usersLoginEntity.accessToken),
        _storage.setRefreshToken(refreshToken: usersLoginEntity.refreshToken),
        _pref.setSocialType(socialType: appleLoginType),
      ]);

      return UiState.success(usersLoginEntity);
    } catch (e, stackTrace) {
      log.d('애플 로그인 실패\n$e\n$stackTrace');
      return UiState.failure('애플 로그인에 실패했습니다.');
    }

    // firebase code - 필요한지 모르겠음..
    // final firebase.OAuthCredential credential =
    //     firebase.OAuthProvider('apple.com').credential(
    //   idToken: appleCredential.identityToken,
    //   accessToken: appleCredential.authorizationCode,
    // );
    // await firebase.FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UsersLoginEntity> postUsersLogin({
    required String identifier,
    required String socialType,
  }) async {
    return await _usersLoginRepository.postUsersLogin(
      entity: UsersLoginEntity(
        identifier: identifier,
        socialType: socialType,
      ),
    );
  }

  // todo 추후 내정보 화면으로 이동할 함수.
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
