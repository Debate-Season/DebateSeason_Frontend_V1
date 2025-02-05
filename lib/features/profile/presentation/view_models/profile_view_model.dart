import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/users_logout_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/users_withdraw_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class ProfileViewModel extends GetxController {
  late final ProfileRepository _profileRepository;
  late final UsersLogoutRepository _usersLogoutRepository;
  late final UsersWithdrawRepository _usersWithdrawRepository;
  final _profile = Rx<UiState<ProfileEntity>>(const UiState.loading());

  UiState<ProfileEntity> get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();

    _profileRepository = Get.find<ProfileRepository>();
    _usersLogoutRepository = Get.find<UsersLogoutRepository>();
    _usersWithdrawRepository = Get.find<UsersWithdrawRepository>();
    getProfile();
  }

  Future<void> getProfile() async {
    final result = await _profileRepository.getProfile();
    _profile.value = result;
    _profile.refresh();
  }

  Future<UiState<String>> postLogout() async {
    return await _usersLogoutRepository.postUsersLogout();
  }

  Future<UiState<String>> postWithdraw() async {
    return await _usersWithdrawRepository.postUsersWithdraw();
  }

  Future<bool> kakaoLogout() async {
    try {
      _kakaoSdkInit();
      await UserApi.instance.unlink();
      log.d('카카오톡 로그아웃 성공');
      return true;
    } catch (e) {
      log.d(e);
      return false;
    }
  }

  void updateProfile({required ProfileEntity profile}) {
    _profile.value = UiState.success(profile);
  }

  void _kakaoSdkInit() {
    KakaoSdk.init(
      nativeAppKey: dotenv.get('KAKAO_APP_KEY'),
      loggingEnabled: true,
    );
  }
}
