import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_profile_view_model.dart';
import 'package:get/get.dart';

class AuthProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthProfileViewModel());
  }
}
