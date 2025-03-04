import 'package:debateseason_frontend_v1/features/home/home_binding.dart';
import 'package:debateseason_frontend_v1/features/issuemap/bindings/issuemap_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/profile_binding.dart';
import 'package:get/get.dart';

import 'main_view_model.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewModel());
    HomeBinding().dependencies();
    IssuemapBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
