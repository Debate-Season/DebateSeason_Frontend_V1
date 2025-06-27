import 'dart:async';

import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/community_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_nickname_check_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/type/district_type.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/type/province_type.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/profile_constants.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInputViewModel extends GetxController {
  late ProfileViewModel _profileViewModel;
  late ProfileRepository _profileRepository;
  late CommunityRepository _communityRepository;
  late ProfileNicknameCheckRepository _profileNicknameCheckRepository;
  late TextEditingController nicknameController;
  late FocusNode nicknameFocusNode;
  late TextEditingController communityController;
  late TextEditingController communitySearchController;
  late TextEditingController ageController;
  late TextEditingController residenceController;
  late TextEditingController homeTownController;
  Timer? _debounceNickname;
  Timer? _debounceCommunity;
  final _profile = Rx<ProfileEntity>(ProfileEntity(
    profileImage: '',
    nickname: '',
    community: CommunityEntity(id: -1, name: '', iconUrl: ''),
    gender: '',
    ageRange: '',
    hometownDistrict: '',
    residenceProvince: '',
    residenceDistrict: '',
    hometownProvince: '',
  ));

  final _previousNickname = ''.obs;
  final _nicknameErrorText = ''.obs;
  final _communities = Rx<UiState<List<CommunityEntity>>>(UiState.loading());
  final _selectedCommunities =
      Rx<UiState<List<CommunityEntity>>>(UiState.loading());
  final _selectedCommunityId = (-1).obs;
  final _selectedAge = ''.obs;
  final _isModifyScreen = false.obs;
  final _isApiLoading = false.obs;
  final _selectedResidenceProvince = Rx<ProvinceType>(ProvinceType.seoul);
  final _selectedResidenceDistrict = Rx<DistrictType?>(null);
  final _selectedHomeTownProvince = Rx<ProvinceType>(ProvinceType.seoul);
  final _selectedHomeTownDistrict = Rx<DistrictType?>(null);

  ProfileEntity get profile => _profile.value;

  String get previousNickname => _previousNickname.value;

  String get nicknameErrorText => _nicknameErrorText.value;

  UiState<List<CommunityEntity>> get communities => _communities.value;

  UiState<List<CommunityEntity>> get selectedCommunities =>
      _selectedCommunities.value;

  int get selectedCommunityId => _selectedCommunityId.value;

  String get selectedAge => _selectedAge.value;

  bool get isModifyScreen => _isModifyScreen.value;

  bool get isApiLoading => _isApiLoading.value;

  ProvinceType get selectedResidenceProvince =>
      _selectedResidenceProvince.value;

  DistrictType? get selectedResidenceDistrict =>
      _selectedResidenceDistrict.value;

  ProvinceType get selectedHomeTownProvince => _selectedHomeTownProvince.value;

  DistrictType? get selectedHomeTownDistrict => _selectedHomeTownDistrict.value;

  @override
  void onInit() {
    super.onInit();

    AmplitudeUtil.trackEvent(eventName: 'ProfileInput');
    nicknameController = TextEditingController();
    nicknameFocusNode = FocusNode();
    communityController = TextEditingController();
    communitySearchController = TextEditingController();
    ageController = TextEditingController();
    residenceController = TextEditingController();
    homeTownController = TextEditingController();
    _debounceNickname?.cancel();
    _debounceCommunity?.cancel();
    _profileRepository = Get.find<ProfileRepository>();
    _communityRepository = Get.find<CommunityRepository>();
    _profileNicknameCheckRepository =
        Get.find<ProfileNicknameCheckRepository>();

    getCommunity();

    final receivedData = Get.arguments;

    if (receivedData != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _profileViewModel = Get.find<ProfileViewModel>();
        final previousProfile = Get.arguments as ProfileEntity;
        _profile.value = previousProfile;
        _previousNickname.value = _profile.value.nickname;
        nicknameController.text = previousProfile.nickname;
        communityController.text = previousProfile.community.name;
        _selectedCommunityId.value = previousProfile.community.id;
        ageController.text = previousProfile.ageRange;
        _selectedAge.value = previousProfile.ageRange;
        _isModifyScreen.value = true;
        _profile.refresh();
      });
    }
  }

  @override
  void dispose() {
    nicknameController.dispose();
    nicknameFocusNode.dispose();
    communityController.dispose();
    communitySearchController.dispose();
    ageController.dispose();
    residenceController.dispose();
    homeTownController.dispose();

    super.dispose();
  }

  Future<void> _getProfileNicknameCheck({required String nickname}) async {
    final statusCode = await _profileNicknameCheckRepository
        .getProfileNicknameCheck(nickname: nickname);

    switch (statusCode) {
      case 200:
        _profile.value = _profile.value.copyWith(nickname: nickname);
        _nicknameErrorText.value = '';
      case 400:
        _nicknameErrorText.value = ProfileConstants.VALID_NICKNAME;
      case 409:
        if (_previousNickname.value != nickname) {
          _nicknameErrorText.value = ProfileConstants.VALID_OVERLAP_NICKNAME;
        }
      default:
        _nicknameErrorText.value = ProfileConstants.VALID_NICKNAME;
    }
  }

  Future<void> getCommunity() async {
    final result = await _communityRepository.getCommunities();
    _communities.value = result;
  }

  Future<void> _getCommunitySearch({required String searchWord}) async {
    final result = await _communityRepository.getCommunitiesSearch(
      searchWord: searchWord,
    );
    _selectedCommunities.value = result;
  }

  Future<UiState<void>> postProfile() async =>
      await _profileRepository.postProfile(
        entity: _profile.value,
      );

  Future<UiState<void>> patchProfile() async {
    _profileViewModel.updateProfile(updatedProfile: _profile.value);

    return await _profileRepository.patchProfile(entity: _profile.value);
  }

  void onChangedNickname({required String nickname}) {
    if (nickname == _previousNickname.value) {
      _nicknameErrorText.value = '';
      return;
    }

    if (_debounceNickname != null) {
      _debounceNickname?.cancel();
    }

    _debounceNickname = Timer(Duration(milliseconds: 500), () {
      _getProfileNicknameCheck(nickname: nickname);
    });
  }

  void onChangedCommunity({required String searchWord}) {
    if (_debounceCommunity != null) {
      _debounceCommunity?.cancel();
    }

    _debounceCommunity = Timer(Duration(milliseconds: 500), () {
      _getCommunitySearch(searchWord: searchWord);
    });
  }

  void setGender({required String gender}) {
    _profile.value = _profile.value.copyWith(gender: gender);
  }

  void setCommunityId({required int communityId}) {
    _communities.value.when(
      loading: () => log.d('커뮤니티 데이터를 로딩 중...'),
      success: (data) {
        final community = data.firstWhere(
            (element) => element.id == communityId,
            orElse: () => CommunityEntity(id: -1, name: '', iconUrl: ''));
        _profile.value = _profile.value.copyWith(community: community);

        if (community.id != -1) {
          communityController.text = community.name;
        } else {
          log.d('해당 communityId에 해당하는 커뮤니티가 없습니다.');
        }
      },
      failure: (message) => log.d('커뮤니티 데이터를 가져오는 데 실패했습니다: $message'),
    );
  }

  void setSelectedCommunityId({required int communityId}) {
    _selectedCommunityId.value = communityId;
  }

  void setAgeRange({required String ageRange}) {
    _profile.value = _profile.value.copyWith(ageRange: ageRange);

    ageController.text = ageRange;
  }

  void setSelectedAge({required String selectedAge}) {
    _selectedAge.value = selectedAge;
  }

  void setApiLoading({required bool isApiLoading}) {
    _isApiLoading.value = isApiLoading;
  }

  bool isValidNickname(String nickname) {
    if (nickname.length < 2 || nickname.length > 8) {
      _nicknameErrorText.value = ProfileConstants.VALID_NICKNAME;
      return false;
    }

    RegExp regex = RegExp(ProfileConstants.PROFILE_NICK_NAME_VALIDITY_REG_EXP);
    if (regex.hasMatch(nickname) == false) {
      _nicknameErrorText.value = ProfileConstants.VALID_NICKNAME;
      return false;
    } else {
      return true;
    }
  }

  bool isValidStartBtn() {
    if (_profile.value.nickname.isNotEmpty &&
        _nicknameErrorText.value.isEmpty &&
        _profile.value.gender.isNotEmpty &&
        _profile.value.ageRange.isNotEmpty &&
        _profile.value.community.id != -1 &&
        _selectedResidenceProvince.value.code.isNotEmpty &&
        _selectedResidenceDistrict.value != null &&
        _selectedHomeTownProvince.value.code.isNotEmpty &&
        _selectedHomeTownDistrict.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void setSelectedResidenceProvince({required ProvinceType province}) {
    _selectedResidenceProvince.value = province;
    _selectedResidenceDistrict.value = null;
  }

  void setSelectedResidenceDistrict(DistrictType district) {
    _selectedResidenceDistrict.value = district;

    _profile.value = _profile.value.copyWith(
      residenceProvince: _selectedResidenceProvince.value.code,
      residenceDistrict: _selectedResidenceDistrict.value!.code,
    );
  }

  void setSelectedHomeTownProvince({required ProvinceType province}) {
    _selectedHomeTownProvince.value = province;
    _selectedHomeTownDistrict.value = null;
  }

  void setSelectedHomeTownDistrict(DistrictType district) {
    _selectedHomeTownDistrict.value = district;

    _profile.value = _profile.value.copyWith(
      hometownProvince: _selectedHomeTownProvince.value.code,
      hometownDistrict: _selectedHomeTownDistrict.value!.code,
    );
  }

  void checkSameToResidence() {
    if (_selectedResidenceDistrict.value != null) {
      _selectedHomeTownProvince.value = _selectedResidenceProvince.value;
      _selectedHomeTownDistrict.value = _selectedResidenceDistrict.value;

      homeTownController.text =
          '${_selectedResidenceProvince.value.name} ${_selectedResidenceDistrict.value?.name}';
    }
  }

  void uncheckSameToResidence() {
    homeTownController.text = '';
    _selectedHomeTownProvince.value = ProvinceType.seoul;
    _selectedHomeTownDistrict.value = null;
  }

  List<DistrictType> getDistrictList(ProvinceType province) {
    switch (province) {
      case ProvinceType.seoul:
        return DistrictType.seoul;
      case ProvinceType.busan:
        return DistrictType.busan;
      case ProvinceType.daegu:
        return DistrictType.daegu;
      case ProvinceType.incheon:
        return DistrictType.incheon;
      case ProvinceType.gwangju:
        return DistrictType.gwangju;
      case ProvinceType.daejeon:
        return DistrictType.daejeon;
      case ProvinceType.ulsan:
        return DistrictType.ulsan;
      case ProvinceType.sejong:
        return DistrictType.sejong;
      case ProvinceType.gyeonggi:
        return DistrictType.gyeonggi;
      case ProvinceType.gangwon:
        return DistrictType.gangwon;
      case ProvinceType.chungbuk:
        return DistrictType.chungbuk;
      case ProvinceType.chungnam:
        return DistrictType.chungnam;
      case ProvinceType.jeonbuk:
        return DistrictType.jeonbuk;
      case ProvinceType.jeonnam:
        return DistrictType.jeonnam;
      case ProvinceType.gyeongbuk:
        return DistrictType.gyeongbuk;
      case ProvinceType.gyeongnam:
        return DistrictType.gyeongnam;
      case ProvinceType.jeju:
        return DistrictType.jeju;
    }
  }
}
