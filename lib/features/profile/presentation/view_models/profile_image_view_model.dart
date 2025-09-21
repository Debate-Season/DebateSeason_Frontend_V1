import 'dart:math';

import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/type/image_type.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_view_model.dart';

class ProfileImageViewModel extends GetxController {
  late ProfileViewModel _profileViewModel;
  late ScrollController scrollController;
  late ProfileRepository _profileRepository;
  final _isModifyScreen = false.obs;
  final _isApiLoading = false.obs;

  final _selectedImage = Rx<ImageType>(ImageType.red);

  bool get isModifyScreen => _isModifyScreen.value;

  ImageType get selectedImage => _selectedImage.value;

  bool get isApiLoading => _isApiLoading.value;

  @override
  void onInit() {
    super.onInit();

    AmplitudeUtil.trackEvent(eventName: 'ProfileImage');
    _profileRepository = Get.find<ProfileRepository>();
    scrollController = ScrollController();
    final arguments = Get.arguments as Map<String, dynamic>;
    _isModifyScreen.value = arguments['is_modify_screen'];
    if (_isModifyScreen.value) {
      _profileViewModel = Get.find<ProfileViewModel>();
      _selectedImage.value = arguments['profile_image'];
    } else {
      _setRandomImage();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _setRandomImage() {
    final random = Random();
    int index = random.nextInt(ImageType.values.length);
    _selectedImage.value = ImageType.values[index];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedImage();
    });
  }

  void setImage({required ImageType imageType}) {
    _selectedImage.value = imageType;
  }

  void _scrollToSelectedImage() {
    final index = ImageType.values.indexOf(_selectedImage.value);
    if (index != -1 && scrollController.hasClients) {
      final position = index * (41 + 8);
      scrollController.animateTo(
        position.toDouble(),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<UiState<void>> patchProfileImage() async {
    if (_isModifyScreen.value) {
      _profileViewModel.updateProfileImage(
        updatedProfileImage: _selectedImage.value.engName,
      );
    }

    return await _profileRepository.patchProfileImage(
      profileImage: _selectedImage.value.engName,
    );
  }

  void setApiLoading({required bool isApiLoading}) {
    _isApiLoading.value = isApiLoading;
  }
}
