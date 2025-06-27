import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/profile_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_image_view_model.dart';
import 'package:get/get.dart';

class ProfileImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDataSource>(() => ProfileDataSource(DioClient().dio));

    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(Get.find<ProfileDataSource>()),
    );

    Get.lazyPut(() => ProfileImageViewModel());
  }
}
