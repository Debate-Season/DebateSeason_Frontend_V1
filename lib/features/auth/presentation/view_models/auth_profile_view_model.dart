import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthProfileViewModel extends GetxController {
  late TextEditingController profileController;
  late TextEditingController communityController;
  late TextEditingController communitySearchController;
  late TextEditingController ageController;
  late TextEditingController ageSearchController;

  @override
  void onInit() {
    super.onInit();

    profileController = TextEditingController();
    communityController = TextEditingController();
    communitySearchController = TextEditingController();
    ageController = TextEditingController();
    ageSearchController = TextEditingController();
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
}
