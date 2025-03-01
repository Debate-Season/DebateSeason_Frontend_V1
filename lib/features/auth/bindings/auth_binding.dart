import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/auth_reissue_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/users_login_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/repository_impls/auth_reissue_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/auth/data/repository_impls/users_login_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/auth_reissue_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/users_login_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/profile_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersLoginDataSource>(
      () => UsersLoginDataSource(DioClient().dio),
    );
    Get.lazyPut<UsersLoginRepository>(
      () => UsersLoginRepositoryImpl(Get.find<UsersLoginDataSource>()),
    );
    Get.lazyPut<AuthReissueDataSource>(
      () => AuthReissueDataSource(DioClient().dio),
    );
    Get.lazyPut<AuthReissueRepository>(
      () => AuthReissueRepositoryImpl(Get.find<AuthReissueDataSource>()),
    );
    Get.lazyPut<ProfileDataSource>(
      () => ProfileDataSource(DioClient().dio),
    );
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(Get.find<ProfileDataSource>()),
    );
    Get.lazyPut(() => AuthViewModel());
  }
}
