import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/users_logout_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/remote/profile_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/remote/users_logout_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/users_logout_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDataSource>(() => ProfileDataSource(DioClient().dio));

    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(Get.find<ProfileDataSource>()),
    );
    Get.lazyPut<UsersLogoutDataSource>(
      () => UsersLogoutDataSource(DioClient().dio),
    );

    Get.lazyPut<UsersLogoutRepository>(
      () => UsersLogoutRepositoryImpl(Get.find<UsersLogoutDataSource>()),
    );

    Get.lazyPut(() => ProfileViewModel());
  }
}
