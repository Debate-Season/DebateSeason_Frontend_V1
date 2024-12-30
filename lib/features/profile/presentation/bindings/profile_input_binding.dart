import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:get/get.dart';

class ProfileInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileInputViewModel());
  }
}
