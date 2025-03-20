import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/splash/data/app_versions_data_source.dart';
import 'package:debateseason_frontend_v1/features/splash/data/app_versions_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/splash/domain/app_versions_repository.dart';
import 'package:debateseason_frontend_v1/features/splash/presentation/splash_view_model.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppVersionsDataSource>(
      () => AppVersionsDataSource(DioClient().dio),
    );

    Get.lazyPut<AppVersionsRepository>(
      () => AppVersionsRepositoryImpl(
        Get.find<AppVersionsDataSource>(),
      ),
    );

    Get.lazyPut(() => SplashViewModel());
  }
}
