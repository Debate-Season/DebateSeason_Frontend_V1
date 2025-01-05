import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }
}
