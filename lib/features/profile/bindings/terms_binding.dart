import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/profile/data/data_sources/terms_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/repository_impls/terms_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/terms_repository.dart';
import 'package:debateseason_frontend_v1/features/profile/presentation/view_models/terms_view_model.dart';
import 'package:get/get.dart';

class TermsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsDataSource>(() => TermsDataSource(DioClient().dio));
    Get.lazyPut<TermsRepository>(
        () => TermsRepositoryImpl(Get.find<TermsDataSource>()));
    Get.lazyPut(() => TermsViewModel());
  }
}
