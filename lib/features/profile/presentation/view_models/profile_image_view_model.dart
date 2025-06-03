import 'dart:math';

import 'package:debateseason_frontend_v1/features/profile/domain/type/image_type.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageViewModel extends GetxController {
  late ScrollController scrollController;

  final _selectedImage = Rx<ImageType>(ImageType.red);

  ImageType get selectedImage => _selectedImage.value;

  @override
  void onInit() {
    super.onInit();

    AmplitudeUtil.trackEvent(eventName: 'ProfileImage');
    scrollController = ScrollController();
    _setRandomImage();
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
}
