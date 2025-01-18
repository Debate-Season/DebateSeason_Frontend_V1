import 'package:debateseason_frontend_v1/features/chat/data/data_sources/room_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class DebateRoomViewModel extends GetxController {
  late final RoomDataSource _roomDataSource;
  final Rx<RoomRes?> _roomData = Rx<RoomRes?>(null);

  RoomRes? get roomData => _roomData.value;

  @override
  void onInit() {
    super.onInit();
    _roomDataSource = Get.find<RoomDataSource>();

    final int chatroomId = (Get.arguments as int?) ?? 1;
    fetchRoomData(chatroomId);
  }

  Future<void> fetchRoomData(int chatroomId) async {
    try {
      final response = await _roomDataSource.getRoom(chatroomId: chatroomId);
      _roomData.value = response.data;
    } catch (e) {
      log.d('Error fetching room data: $e');
    }
  }

// Future<String> fetchRoomTitle(int chatroomId) async {
//   try {
//     final response = await _roomDataSource.getRoom(chatroomId: chatroomId);
//     String roomTitle = response.data.title;
//     return roomTitle;
//   } catch (e) {
//     log.d('Error fetching room data: $e');
//     return '불러오지 못함'; // Return an empty string as a fallback
//   }
// }

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
