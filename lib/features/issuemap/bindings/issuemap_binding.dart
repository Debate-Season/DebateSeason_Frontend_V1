import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/issuemap/data/data_sources/remote/users_home_data_source.dart';
import 'package:debateseason_frontend_v1/features/issuemap/data/repository_impls/remote/users_home_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/issuemap/domain/repositories/remote/users_home_repository.dart';
import 'package:debateseason_frontend_v1/features/issuemap/presentation/view_models/issuemap_view_model.dart';
import 'package:get/get.dart';

class IssuemapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersHomeDataSource>(
      () => UsersHomeDataSource(DioClient().dio),
    );

    Get.lazyPut<UsersHomeRepository>(
      () => UsersHomeRepositoryImpl(Get.find<UsersHomeDataSource>()),
    );

    Get.lazyPut(() => IssuemapViewModel());
  }
}
