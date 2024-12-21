import 'dart:convert';

import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

import '../../data/models/response/message_response.dart';

class ChatRoomViewModel extends GetxController {
  final StompService _stompService = StompService();

  var receivedMessages = <MessageResponse>[].obs;
  var sentMessages = <MessageRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    log.d('1. init');

    _stompService.connect(
      dotenv.get("WEB_SOCKET_BASE_URL"),
      (frame) {
        log.d('2. chat server 연결!: ${frame.headers}');
        _stompService.subscribe('/chat.room.1', (msg) {
          log.d('3. 서버에서 받은 메세지: $msg');
          if (msg != null) {
            try {
              MessageResponse messageResponse = MessageResponse.fromJson(jsonDecode(msg));
              receivedMessages.add(messageResponse);
              log.d('4. 구독 연결~');
            } catch (e){
              log.d('4. 구독 실패: $e');
            }
          }
        });
      },
      (error) => log.d('2. chat server 에러: $error'),
    );
  }

  void sendMessage(MessageRequest messageRequest) {
    // _stompService.sendMessage('/app/chat.sendMessage', message);
    String message = jsonEncode(messageRequest.toJson());
    // _stompService.sendMessage('/app/chat.sendMessage', message);
    _stompService.sendMessage('/topic/room1', message);
    sentMessages.add(messageRequest);
  }

  @override
  void onClose(){
    _stompService.disconnect();
    super.onClose();
  }
}
