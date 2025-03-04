import 'package:debateseason_frontend_v1/features/category/bindings/category_binding.dart';
import 'package:debateseason_frontend_v1/features/home/home_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/profile_binding.dart';
import 'package:get/get.dart';

import 'main_view_model.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewModel());
    HomeBinding().dependencies();
    CategoryBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
