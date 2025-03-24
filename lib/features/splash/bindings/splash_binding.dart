import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/splash/data/app_version_data_source.dart';
import 'package:debateseason_frontend_v1/features/splash/data/app_version_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_version_repository.dart';
import 'package:debateseason_frontend_v1/features/splash/presentation/splash_view_model.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppVersionDataSource>(
      () => AppVersionDataSource(DioClient().dio),
    );

    Get.lazyPut<AppVersionRepository>(
      () => AppVersionRepositoryImpl(
        Get.find<AppVersionDataSource>(),
      ),
    );

    Get.lazyPut(() => SplashViewModel());
  }
}
