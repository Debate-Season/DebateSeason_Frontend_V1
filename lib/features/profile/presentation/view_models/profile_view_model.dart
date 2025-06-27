import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/users_logout_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/users_withdraw_repository.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class ProfileViewModel extends GetxController {
  final _storage = SecureStorageService();
  final _pref = SharedPreferencesService();
  late final ProfileRepository _profileRepository;
  late final UsersLogoutRepository _usersLogoutRepository;
  late final UsersWithdrawRepository _usersWithdrawRepository;
  final _profile = Rx<UiState<ProfileEntity>>(const UiState.loading());

  UiState<ProfileEntity> get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();

    AmplitudeUtil.trackEvent(eventName: 'Profile');
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

  Future<UiState<void>> postLogout() async {
    return await _usersLogoutRepository.postUsersLogout();
  }

  Future<UiState<void>> postWithdraw() async {
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

  void updateProfile({required ProfileEntity updatedProfile}) {
    _profile.value.when(
      loading: () {},
      success: (profile) {
        final newProfile = profile.copyWith(
          nickname: updatedProfile.nickname,
          community: updatedProfile.community,
          gender: updatedProfile.gender,
          ageRange: updatedProfile.ageRange,
          residenceProvince: updatedProfile.residenceProvince,
          residenceDistrict: updatedProfile.residenceDistrict,
          hometownProvince: updatedProfile.hometownProvince,
          hometownDistrict: updatedProfile.hometownDistrict,
        );
        _profile.value = UiState.success(newProfile);
      },
      failure: (msg) {},
    );
    _profile.refresh();
  }

  void updateProfileImage({required String updatedProfileImage}) {
    _profile.value.when(
      loading: () {},
      success: (profile) {
        final newProfile = profile.copyWith(profileImage: updatedProfileImage);
        _profile.value = UiState.success(newProfile);
      },
      failure: (msg) {},
    );
    _profile.refresh();
  }

  void _kakaoSdkInit() {
    KakaoSdk.init(
      nativeAppKey: dotenv.get('KAKAO_APP_KEY'),
      loggingEnabled: true,
    );
  }

  Future<void> clearStorage() async => await Future.wait([
        _storage.clear(),
        _pref.clear(),
      ]);
}
