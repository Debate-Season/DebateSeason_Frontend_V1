import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/category/data/data_sources/remote/users_home_data_source.dart';
import 'package:debateseason_frontend_v1/features/category/data/repository_impls/remote/users_home_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/category/domain/repositories/remote/users_home_repository.dart';
import 'package:debateseason_frontend_v1/features/category/presentation/view_models/category_view_model.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersHomeDataSource>(
      () => UsersHomeDataSource(DioClient().dio),
    );

    Get.lazyPut<UsersHomeRepository>(
      () => UsersHomeRepositoryImpl(Get.find<UsersHomeDataSource>()),
    );

    Get.lazyPut(() => CategoryViewModel());
  }
}
