import 'package:debateseason_frontend_v1/features/chat/data/data_sources/room_data_source.dart';
import 'package:get/get.dart';

class DebateRoomViewModel extends GetxController {
  late final RoomDataSource _roomDataSource;

  RxInt agreeCount = 0.obs;
  RxInt disagreeCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _roomDataSource = Get.find<RoomDataSource>();
  }

  void voteAgree() async{
    agreeCount++;
    final agree = await _roomDataSource.getRoom(chatroomId: 1);
    print(agree.data.opinion);
  }

  void voteDisagree() {
    disagreeCount++;
  }
}