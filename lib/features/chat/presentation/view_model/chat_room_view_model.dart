import 'dart:convert';

import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/msg_new_res.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/msg_res.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class ChatRoomViewModel extends GetxController {
  final StompService _stompService = StompService();

  var receivedMessages = <MsgNewRes>[].obs;
  var sentMessages = <MsgNewRes>[].obs;

  var chatRoomId = (-1).obs;
  var chatRoomTitle = ''.obs;

  void setChatRoomDetails(int roomId, String title) {
    chatRoomId.value = roomId;
    chatRoomTitle.value = title;
  }

  @override
  void onInit() {
    super.onInit();
    try {
      final Map<String, dynamic> arguments = Get.arguments;
      final int chatRoomId = arguments['chat_room_id'] ?? -1;
      final String chatRoomTitle = arguments['chat_room_title'] ?? '';
      setChatRoomDetails(chatRoomId, chatRoomTitle);
    } catch (e) {
      log.d('에러: $e');
    }

    _addDummyMessages();
    log.d(receivedMessages);

    _stompService.connect(
      dotenv.get("WEB_SOCKET_BASE_URL"),
          (frame) {
        log.d('2. chat server 연결!: ${frame.headers}, ${frame.body}');
        _stompService.subscribe('/topic/room$chatRoomId', (msg) {
          log.d('3. 서버에서 받은 메세지: $msg');
          try {
            MsgNewRes msgRes = MsgNewRes.fromJson(jsonDecode(msg));
            receivedMessages.add(msgRes);
            log.d('4. 구독 연결~');
          } catch (e) {
            log.d('4. 구독 실패: $e');
          }
        });
      },
          (error) => log.d('2. chat server 에러: $error'),
    );
  }

  void _addDummyMessages() {
    // receivedMessages.add(
    //   MsgNewRes(
    //     date: '2025-01-19',
    //     chatMsgRes: [
    //       id: 1, // todo 메시지 ID 이거 왜 에러나지
    //       messageType: "CHAT",
    //       sender: "홍길동",
    //       content: "안녕하세요, 토론에 참여하게 되어 반갑습니다.",
    //       opinionType: "AGREE",
    //       userCommunity: "에펨코리아",
    //       timeStamp: [
    //         2025,
    //         1,
    //         19,
    //         17,
    //         43,
    //         0,
    //         893435000
    //       ]
    //     ],
    //   ),
    // );
  }

  void sendMessage(MsgNewRes messageRequest) {
    String message = jsonEncode(messageRequest.toJson());
    _stompService.sendMessage('/stomp/chat.room.$chatRoomId', message);
    sentMessages.add(messageRequest);
    receivedMessages.add(
      MsgNewRes(
        date: messageRequest.date,
        chatMsgRes: [
          id: messageRequest.id, // todo 메시지 ID 이거 왜 에러나지
          messageType: messageRequest.messageType,
          sender: messageRequest.sender,
          content: messageRequest.content,
          opinionType: messageRequest.opinionType,
          userCommunity: messageRequest.userCommunity,
          timeStamp: messageRequest.DateTime.timestamp(),
        ],
      ),
    );
  }

  @override
  void onClose() {
    _stompService.disconnect();
    super.onClose();
  }
}
