import 'package:debateseason_frontend_v1/core/network/dio_client.dart';
import 'package:debateseason_frontend_v1/features/issue/data/datasources/remote/issue_data_source.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_model/issue_room_view_model.dart';
import 'package:get/get.dart';

class IssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IssueRoomViewModel());
    Get.lazyPut<IssueDataSource>(()=> IssueDataSource(DioClient().dio));
  }
}
