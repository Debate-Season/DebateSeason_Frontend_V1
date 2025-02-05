import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/auth/auth_constants.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/users_login_entity.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/users_login_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
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

  Future<UiState<UsersLoginEntity>> loginWithKakao() async {
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
        socialType: AuthConstants.kakaoLoginType,
      );

      await _getProfile();

      return UiState.success(usersLoginEntity);
    } catch (e) {
      log.d('카카오 로그인 실패\n$e');
      return UiState.failure('카카오 로그인에 실패했습니다.');
    }
  }

  Future<UiState<UsersLoginEntity>> loginWithApple() async {
    try {
      final user = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);

      final usersLoginEntity = await postUsersLogin(
        identifier: user.userIdentifier.toString(),
        socialType: AuthConstants.appleLoginType,
      );

      await _getProfile();

      return UiState.success(usersLoginEntity);
    } catch (e, stackTrace) {
      log.d('애플 로그인 실패\n$e\n$stackTrace');
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
}
