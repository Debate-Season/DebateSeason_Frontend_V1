import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/community_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/profile_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/profile_nickname_check_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/community_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/profile_nickname_check_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/profile_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/community_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_nickname_check_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/profile_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/profile_input_view_model.dart';
import 'package:get/get.dart';

class ProfileInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityDataSource>(
        () => CommunityDataSource(DioClient().dio));

    Get.lazyPut<CommunityRepository>(
      () => CommunityRepositoryImpl(Get.find<CommunityDataSource>()),
    );

    Get.lazyPut<ProfileDataSource>(() => ProfileDataSource(DioClient().dio));

    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(Get.find<ProfileDataSource>()),
    );

    Get.lazyPut<ProfileNicknameCheckDataSource>(
      () => ProfileNicknameCheckDataSource(DioClient().dio),
    );

    Get.lazyPut<ProfileNicknameCheckRepository>(
      () => ProfileNicknameCheckRepositoryImpl(
        Get.find<ProfileNicknameCheckDataSource>(),
      ),
    );

    Get.lazyPut(() => ProfileInputViewModel());
  }
}
