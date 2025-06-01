import 'package:debateseason_frontend_v1/features/home/bindings/media_binding.dart';
import 'package:debateseason_frontend_v1/features/home/bindings/recommend_binding.dart';
import 'package:debateseason_frontend_v1/features/issuemap/bindings/issuemap_binding.dart';
import 'package:debateseason_frontend_v1/features/profile/bindings/profile_binding.dart';
import 'package:get/get.dart';

import 'main_view_model.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewModel());
    MediaBinding().dependencies();
    RecommendBinding().dependencies();
    IssuemapBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
