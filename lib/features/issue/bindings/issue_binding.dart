import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/issue/data/datasources/issue_data_source.dart';
import 'package:debateseason_frontend_v1/features/issue/data/repositories_impls/issue_repository_impl.dart';
import 'package:debateseason_frontend_v1/features/issue/domain/repositories/issue_repository.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_models/issue_room_view_model.dart';
import 'package:get/get.dart';

class IssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IssueRoomViewModel());
    Get.lazyPut<IssueDataSource>(()=> IssueDataSource(DioClient().dio));
    Get.lazyPut<IssueRepository>(() => IssueRepositoryImpl(Get.find<IssueDataSource>()));
  }
}
