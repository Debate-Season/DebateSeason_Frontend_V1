import 'dart:developer';

import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class ChatRoomViewModel extends GetxController {
  final StompService _stompService = StompService();

  var messages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _stompService.connect(
      dotenv.get("WEB_SOCKET_BASE_URL"),
      (frame) => log('chat server 연결!'),
      (error) => log('chat server 에러: $error'),
    );
    _stompService.subscribe('/topic/public', (msg) => messages.add(msg));
  }

  void sendMessage(String message) {
    _stompService.sendMessage('/app/chat.sendMessage', message);
  }

  @override
  void onClose(){
    _stompService.disconnect();
    super.onClose();
  }
}
