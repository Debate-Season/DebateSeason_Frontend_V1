import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_image_view_model.dart';
import 'package:get/get.dart';

class ProfileImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileImageViewModel());
  }
}
