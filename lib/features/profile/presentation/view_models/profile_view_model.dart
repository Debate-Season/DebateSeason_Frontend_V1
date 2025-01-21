import 'dart:io';

import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/users_logout_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class ProfileViewModel extends GetxController {
  late final ProfileRepository _profileRepository;
  late final UsersLogoutRepository _usersLogoutRepository;
  final _profile = Rx<UiState<ProfileEntity>>(const UiState.loading());

  UiState<ProfileEntity> get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();

    _profileRepository = Get.find<ProfileRepository>();
    _usersLogoutRepository = Get.find<UsersLogoutRepository>();
    getProfile();
  }

  Future<void> getProfile() async {
    final result = await _profileRepository.getProfile();
    _profile.value = result;
    _profile.refresh();
  }

  Future<bool> logout() async {
    await _usersLogoutRepository.postUsersLogout();

    if (Platform.isAndroid) {
      return await kakaoLogout();
    } else if (Platform.isIOS) {
      // iOS는 따로 로그아웃이 필요 없음.
      return true;
    }

    return false;
  }

  Future<bool> kakaoLogout() async {
    try {
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
}
