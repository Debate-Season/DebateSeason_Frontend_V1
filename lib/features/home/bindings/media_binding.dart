import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/home/data/datasources/media_data_source.dart';
import 'package:debateseason_frontend_v1/features/home/data/repository_impls/media_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/media_repository.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/media_view_model.dart';
import 'package:get/get.dart';

class MediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MediaViewModel());
    Get.lazyPut<MediaDataSource>(() => MediaDataSource(DioClient().dio));
    Get.lazyPut<MediaRepository>(() => MediaRepositoryImpl(Get.find<MediaDataSource>()));
  }
}
