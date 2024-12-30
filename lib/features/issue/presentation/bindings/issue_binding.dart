import 'package:debateseason_frontend_v1/features/issue/presentation/view_model/issue_room_view_model.dart';
import 'package:get/get.dart';

class IssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IssueRoomViewModel());
  }
}
