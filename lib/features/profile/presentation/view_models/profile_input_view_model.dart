import 'dart:async';

import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/community_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_nickname_check_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
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
      ProfileEntity(nickname: '', communityId: -1, gender: '', ageRange: ''));
  final _nicknameError = ''.obs;
  final _communities = Rx<UiState<List<CommunityEntity>>>(UiState.loading());
  final _selectedCommunityId = (-1).obs;
  final _selectedAge = ''.obs;

  ProfileEntity get profile => _profile.value;

  String get nicknameError => _nicknameError.value;

  UiState<List<CommunityEntity>> get communities => _communities.value;

  int get selectedCommunityId => _selectedCommunityId.value;

  String get selectedAge => _selectedAge.value;

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
    _communities.value = result;
  }

  Future<void> _getCommunitySearch({required String searchWord}) async {
    final result = await _communityRepository.getCommunitiesSearch(
      searchWord: searchWord,
    );
    _communities.value = result;
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

  void onChangedNickname({required String nickname}) {
    if (_debounceTimer != null) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(Duration(milliseconds: 300), () {
      _getProfileNicknameCheck(nickname: nickname);
    });
  }

  void setSelectedCommunityId({required int communityId}) {
    _selectedCommunityId.value = communityId;
  }

  void setCommunityId({required int communityId}) {
    _profile.value = _profile.value.copyWith(communityId: communityId);

    _communities.value.when(
      loading: () => log.d('커뮤니티 데이터를 로딩 중...'),
      success: (data) {
        final community = data.firstWhere(
            (element) => element.id == communityId,
            orElse: () => CommunityEntity(id: -1, name: '', iconUrl: ''));

        if (community.id != -1) {
          communityController.text = community.name;
        } else {
          log.d('해당 communityId에 해당하는 커뮤니티가 없습니다.');
        }
      },
      failure: (message) => log.d('커뮤니티 데이터를 가져오는 데 실패했습니다: $message'),
    );
  }

  void onChangedCommunity({required String searchWord}) {
    if (_debounceTimer != null) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(Duration(milliseconds: 300), () {
      _getCommunitySearch(searchWord: searchWord);
    });
  }

  void setGender({required String gender}) {
    _profile.value = _profile.value.copyWith(gender: gender);
  }

  void setAgeRange({required String ageRange}) {
    _profile.value = _profile.value.copyWith(ageRange: ageRange);

    ageController.text = ageRange;
  }

  void setSelectedAge({required String selectedAge}) {
    _selectedAge.value = selectedAge;
  }
}
