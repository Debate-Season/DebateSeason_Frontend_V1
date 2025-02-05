import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/remote/auth_reissue_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/remote/users_login_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/repository_impls/remote/auth_reissue_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/auth/data/repository_impls/remote/users_login_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/auth_reissue_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/users_login_repository.dart';
import 'package:debateseason_frontend_v1/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/remote/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/remote/profile_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
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
