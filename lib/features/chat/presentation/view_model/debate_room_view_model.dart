import 'package:debateseason_frontend_v1/features/chat/data/data_sources/room_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class DebateRoomViewModel extends GetxController {
  late final RoomDataSource _roomDataSource;
  final Rx<RoomRes?> roomData = Rx<RoomRes?>(null);

  //RxInt agreeCount = 0.obs;
  //RxInt disagreeCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _roomDataSource = Get.find<RoomDataSource>();
  }

  Future<void> fetchRoomData(int chatroomId) async {
    try {
      final response = await _roomDataSource.getRoom(chatroomId: chatroomId);
      roomData.value = response.data;
      log.d(response);
    } catch (e) {
      log.d('Error fetching room data: $e');
    }
  }

// void voteAgree() async{
//   agreeCount++;
//   final agree = await _roomDataSource.getRoom(chatroomId: 1);
//   print(agree.data.opinion);
// }
//
// void voteDisagree() {
//   disagreeCount++;
// }
}
