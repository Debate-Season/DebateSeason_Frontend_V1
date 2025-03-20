import 'package:debateseason_frontend_v1/features/splash/domain/app_versions_repository.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  late AppVersionsRepository _appVersionsRepository;

  @override
  void onInit() {
    super.onInit();

    _appVersionsRepository = Get.find<AppVersionsRepository>();
  }
}
