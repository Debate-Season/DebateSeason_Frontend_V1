import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController {
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void changeTabIndex(int index) {
    _selectedIndex.value = index;

    final eventNames = ['GNB홈', 'GNB이슈맵', 'GNB프로필'];
    AmplitudeUtil.trackEvent(eventName: eventNames[index]);
  }
}
