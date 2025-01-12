import 'package:get/get.dart';

class DebateRoomViewModel extends GetxController {
  RxInt agreeCount = 0.obs;
  RxInt disagreeCount = 0.obs;

  void voteAgree() {
    agreeCount++;
  }

  void voteDisagree() {
    disagreeCount++;
  }
}