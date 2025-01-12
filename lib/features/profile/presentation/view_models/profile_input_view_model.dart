import 'dart:async';

import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/community_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_nickname_check_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInputViewModel extends GetxController {
  late TextEditingController profileController;
  late TextEditingController communityController;
  late TextEditingController communitySearchController;
  late TextEditingController ageController;
  late TextEditingController ageSearchController;
  late ProfileRepository _profileRepository;
  late CommunityRepository _communityRepository;
  late ProfileNicknameCheckRepository _profileNicknameCheckRepository;
  Timer? _debounceTimer;
  final _profile = Rx<ProfileEntity>(
    ProfileEntity(nickname: '', communityId: -1, gender: '', ageRange: ''),
  );
  final _nicknameError = ''.obs;
  final _community = Rx<UiState<List<CommunityEntity>>>(UiState.loading());

  ProfileEntity get profile => _profile.value;

  String get nicknameError => _nicknameError.value;

  UiState<List<CommunityEntity>> get community => _community.value;

  @override
  void onInit() {
    super.onInit();

    profileController = TextEditingController();
    communityController = TextEditingController();
    communitySearchController = TextEditingController();
    ageController = TextEditingController();
    ageSearchController = TextEditingController();
    _debounceTimer?.cancel();
    _profileRepository = Get.find<ProfileRepository>();
    _communityRepository = Get.find<CommunityRepository>();
    _profileNicknameCheckRepository =
        Get.find<ProfileNicknameCheckRepository>();

    getCommunity();
  }

  @override
  void dispose() {
    profileController.dispose();
    communityController.dispose();
    communitySearchController.dispose();
    ageController.dispose();
    ageSearchController.dispose();

    super.dispose();
  }

  Future<void> getCommunity() async {
    final result = await _communityRepository.getCommunities();
    _community.value = result;
  }

  Future<void> getCommunitySearch(String searchWord) async {
    final result = await _communityRepository.getCommunitiesSearch(
      searchWord: searchWord,
    );
    _community.value = result;
  }

  Future<void> _getProfileNicknameCheck({required String nickname}) async {
    final response =
        await _profileNicknameCheckRepository.getProfileNicknameCheck(
      nickname: nickname,
    );

    switch (response.status) {
      case 200:
        Get.snackbar('닉네임', response.message);
      default:
        _nicknameError.value = response.message;
    }
  }

  Future<void> postProfile() async {
    final result = await _profileRepository.postProfile(
      entity: _profile.value,
    );
  }

  Future<void> patchProfile() async {
    final result = await _profileRepository.patchProfile(
      entity: _profile.value,
    );
  }

  void onTextChanged({required String text}) {
    if (_debounceTimer != null) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(Duration(milliseconds: 300), () {
      _getProfileNicknameCheck(nickname: text);
    });
  }
}
