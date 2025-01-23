import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/core/services/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class ChatRoomViewModel extends GetxController {
  late StompService _stompService;
  late SharedPreferencesService _pref;

  final _chatMessages = <ChatMessageEntity>[].obs;

  final _chatRoomId = (-1).obs;
  final _chatRoomTitle = ''.obs;

  List<ChatMessageEntity> get chatMessages => _chatMessages;

  int get chatRoomId => _chatRoomId.value;

  String get chatRoomTitle => _chatRoomTitle.value;

  @override
  void onInit() {
    super.onInit();

    _stompService = StompService();
    _pref = SharedPreferencesService();

    try {
      final Map<String, dynamic> arguments = Get.arguments;
      final int roomId = arguments['chat_room_id'] ?? -1;
      final String roomTitle = arguments['chat_room_title'] ?? '';
      final String opinionType = arguments['opinion_type'] ?? 'AGREE';
      setChatRoomDetails(roomId, roomTitle);
    } catch (e) {
      log.d('에러: $e');
    }

    _initStompConnect();
    _subscribeMessage();
  }

  @override
  void onClose() {
    _stompService.disconnect();
    super.onClose();
  }

  void _initStompConnect() {
    _stompService.connectStomp(chatRoomId: _chatRoomId.value);
  }

  void _subscribeMessage() {
    _stompService.chatStream.listen(
      (chatMessage) {
        try {
          _chatMessages.add(chatMessage);
        } catch (e) {
          log.d("메시지 처리 오류: $e");
        }
      },
      onError: (error) {
        log.d("Error subscribe: $error");
      },
      onDone: () {
        log.d("Stream closed.");
      },
      cancelOnError: false,
    );
  }

  void sendMessage({required String content}) {
    try {
      final chatMessage = ChatMessageEntity(
        messageType: 'CHAT',
        content: content,
        sender: _pref.getNickname(),
        opinionType: 'AGREE',
        userCommunity: _pref.getCommunity(),
        timeStamp: DateTime.now(),
      );

      _stompService.sendStomp(
        chatRoomId: _chatRoomId.value,
        chatMessage: chatMessage,
      );

      _chatMessages.add(chatMessage);
    } catch (e) {
      log.d("메시지 전송 중 오류 발생: $e");
    }
  }

  void setChatRoomDetails(int roomId, String title) {
    _chatRoomId.value = roomId;
    _chatRoomTitle.value = title;
  }
}
