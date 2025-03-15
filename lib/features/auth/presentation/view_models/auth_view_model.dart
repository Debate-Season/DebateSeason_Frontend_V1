import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/auth/auth_constants.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/users_login_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthViewModel extends GetxController {
  final SharedPreferencesService _pref = SharedPreferencesService();
  late final UsersLoginRepository _usersLoginRepository;
  late final ProfileRepository _profileRepository;

  @override
  void onInit() {
    super.onInit();

    _usersLoginRepository = Get.find<UsersLoginRepository>();
    _profileRepository = Get.find<ProfileRepository>();
    _kakaoSdkInit();
  }

  void _kakaoSdkInit() {
    KakaoSdk.init(
      nativeAppKey: dotenv.get('KAKAO_APP_KEY'),
      loggingEnabled: true,
    );
  }

  Future<UiState<bool>> loginWithKakao() async {
    try {
      final isInstalled = await isKakaoTalkInstalled();
      OAuthToken kakaoToken;
      if (isInstalled) {
        kakaoToken = await UserApi.instance.loginWithKakaoTalk();
      } else {
        kakaoToken = await UserApi.instance.loginWithKakaoAccount();
      }

      log.d(kakaoToken.idToken);
      if (kakaoToken.idToken == null && kakaoToken.accessToken.isEmpty) {
        return UiState.failure('카카오 계정으로 로그인해주세요.');
      }

      final profileStatus = await postUsersLogin(
        idToken: kakaoToken.idToken!,
        socialType: AuthConstants.kakaoLoginType,
      );

      if (profileStatus) {
        await _getProfile();
      }

      return UiState.success(profileStatus);
    } catch (e, stack) {
      log.d('카카오 로그인 실패\n $e \n $stack');
      return UiState.failure('카카오 로그인에 실패했습니다.');
    }
  }

  Future<UiState<bool>> loginWithApple() async {
    try {
      final appleAuth = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);

      if (appleAuth.identityToken == null && appleAuth.identityToken!.isEmpty) {
        return UiState.failure('애플 계정으로 로그인해주세요.');
      }

      final profileStatus = await postUsersLogin(
        idToken: appleAuth.identityToken!,
        socialType: AuthConstants.appleLoginType,
      );

      await _getProfile();

      return UiState.success(profileStatus);
    } catch (e, stack) {
      log.d('애플 로그인 실패\n $e \n $stack');
      return UiState.failure('애플 로그인에 실패했습니다.');
    }
  }

  Future<void> _getProfile() async {
    try {
      final result = await _profileRepository.getProfile();

      result.when(
        loading: () {},
        success: (profile) {
          _pref.setNickname(nickname: profile.nickname);
          _pref.setCommunity(community: profile.community.name);
        },
        failure: (msg) {},
      );
    } catch (e, stack) {
      log.d('$e \n $stack');
    }
  }

  Future<bool> postUsersLogin({
    required String idToken,
    required String socialType,
  }) async {
    return await _usersLoginRepository.postUsersLogin(
      entity: UsersLoginEntity(
        idToken: idToken,
        socialType: socialType,
      ),
    );
  }
}
