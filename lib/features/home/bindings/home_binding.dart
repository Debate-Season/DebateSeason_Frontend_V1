import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/home/data/datasources/recommend_data_source.dart';
import 'package:debateseason_frontend_v1/features/home/data/repository_impls/recommend_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/home/domain/repositories/recommend_repository.dart';
import 'package:debateseason_frontend_v1/features/home/presentation/view_models/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut<RecommendDataSource>(() => RecommendDataSource(DioClient().dio));
    Get.lazyPut<RecommendRepository>(() => RecommendRepositoryImpl(Get.find<RecommendDataSource>()));
  }
}
