import 'dart:convert';

import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

import 'package:debateseason_frontend_v1/features/chat/data/models/response/message_response.dart';

class ChatRoomViewModel extends GetxController {
  final StompService _stompService = StompService();

  var receivedMessages = <MessageResponse>[].obs;
  var sentMessages = <MessageRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    log.d('1. init');
    _addDummyMessages();
    log.d('1-1. 더미데이터 호출');
    log.d(receivedMessages);

    _stompService.connect(
      dotenv.get("WEB_SOCKET_BASE_URL"),
      (frame) {
        log.d('2. chat server 연결!: ${frame.headers}, ${frame.body}');
        _stompService.subscribe('/topic/room1', (msg) {
          log.d('3. 서버에서 받은 메세지: $msg');
          try {
            MessageResponse messageResponse = MessageResponse.fromJson(jsonDecode(msg));
            receivedMessages.add(messageResponse);
            log.d('4. 구독 연결~');
          } catch (e) {
            log.d('4. 구독 실패: $e');
          }
        });
      },
      (error) => log.d('2. chat server 에러: $error'),
    );
  }

  // 메세지 리스트 출력을 위한 더미 데이터
  void _addDummyMessages() {
    receivedMessages.addAll([
      MessageResponse(sender: '지니어스', content: '안녕!', category: '찬성'),
      MessageResponse(sender: '도도', content: '하이!', category: '반대'),
      MessageResponse(sender: '지니어스', content: '아아아아안녕', category: '찬성'),
      MessageResponse(sender: '도도', content: 'ㅎㅎㅎㅎㅎㅎㅎ!', category: '반대'),
    ]);
  }

  void sendMessage(MessageRequest messageRequest) {
    String message = jsonEncode(messageRequest.toJson());
    _stompService.sendMessage('/stomp/chat.room.1', message);
    sentMessages.add(messageRequest);
    receivedMessages.add(
      MessageResponse(
        sender: messageRequest.sender,
        content: messageRequest.content,
        category: '찬성', //나중에 수정
      ),
    );
  }

  @override
  void onClose() {
    _stompService.disconnect();
    super.onClose();
  }
}
