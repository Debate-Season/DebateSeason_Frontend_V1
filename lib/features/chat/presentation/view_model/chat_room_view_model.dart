import 'dart:convert';
import 'dart:developer';

import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../data/models/response/message_response.dart';

class ChatRoomViewModel extends GetxController {
  final StompService _stompService = StompService();

  var receivedMessages = <MessageResponse>[].obs;
  var sentMessages = <MessageRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    _stompService.connect(
      dotenv.get("WEB_SOCKET_BASE_URL"),
      (frame) => log('chat server 연결!'),
      (error) => log('chat server 에러: $error'),
    );
    _stompService.subscribe('/topic/public', (msg) {
      MessageResponse messageResponse = MessageResponse.fromJson(jsonDecode(msg));
      receivedMessages.add(messageResponse);
    });
  }

  void sendMessage(MessageRequest messageRequest) {
    // _stompService.sendMessage('/app/chat.sendMessage', message);
    String message = jsonEncode(messageRequest.toJson());
    _stompService.sendMessage('/app/chat.sendMessage', message);
    sentMessages.add(messageRequest);
  }

  @override
  void onClose(){
    _stompService.disconnect();
    super.onClose();
  }
}
