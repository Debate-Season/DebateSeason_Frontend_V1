import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/remote/users_login_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/repository_impls/remote/users_login_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/users_login_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecureStoreService());

    Get.lazyPut<UsersLoginDataSource>(
      () => UsersLoginDataSource(DioClient().dio),
    );

    Get.lazyPut<UsersLoginRepository>(
      () => UsersLoginRepositoryImpl(Get.find<UsersLoginDataSource>()),
    );

    Get.lazyPut(() => AuthViewModel());
  }
}
