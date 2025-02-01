import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/core/services/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/repositories/chat_rooms_messages_repository.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/chat_message_type.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRoomViewModel extends GetxController {
  late StompService _stompService;
  late SharedPreferencesService _pref;
  late ChatRoomsMessagesRepository _chatRoomsMessagesRepository;

  final _chatMessages = <ChatMessageEntity>[].obs;
  final _chatRoomId = (-1).obs;
  final _chatRoomTitle = ''.obs;
  String? _lastAddedChatDate;

  List<ChatMessageEntity> get chatMessages => _chatMessages;

  int get chatRoomId => _chatRoomId.value;

  String get chatRoomTitle => _chatRoomTitle.value;

  @override
  void onInit() {
    super.onInit();

    _stompService = StompService();
    _pref = SharedPreferencesService();
    _chatRoomsMessagesRepository = Get.find<ChatRoomsMessagesRepository>();

    try {
      final Map<String, dynamic> arguments = Get.arguments;
      final int roomId = arguments['chat_room_id'] ?? -1;
      final String roomTitle = arguments['chat_room_title'] ?? '';
      final String opinionType = arguments['opinion_type'] ?? 'AGREE';
      setChatRoomDetails(roomId, roomTitle);
    } catch (e) {
      log.d('에러: $e');
    }
    _getChatRoomMessages();
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
        messageType: ChatMessageType.chat.value,
        content: content,
        sender: _pref.getNickname(),
        opinionType: 'AGREE',
        userCommunity: _pref.getCommunity(),
      );

      _stompService.sendStomp(
        chatRoomId: _chatRoomId.value,
        chatMessage: chatMessage,
      );

      _chatMessages.add(chatMessage.copyWith(timeStamp: DateTime.now()));
    } catch (e) {
      log.d("메시지 전송 중 오류 발생: $e");
    }
  }

  void _getChatRoomMessages({String? nextCursor}) async {
    final result = await _chatRoomsMessagesRepository.getChatRoomsMessages(
      roomId: _chatRoomId.value,
      nextCursor: nextCursor,
    );

    result.when(
      loading: () {},
      success: (chatMessageCursor) {
        String? previousDate;

        for (final chatRoomMessage in chatMessageCursor.chatRoomMessages) {
          final reversMessages = chatRoomMessage.messages.reversed.toList();
          _chatMessages.insertAll(0, reversMessages);

          final messageDate = DateTime.parse(chatRoomMessage.date);
          if (previousDate != chatRoomMessage.date) {
            final today = DateTime.now();
            String formatDate = (today.year == messageDate.year &&
                    today.month == messageDate.month &&
                    today.day == messageDate.day)
                ? '오늘'
                : DateFormat('yyyy-MM-dd').format(messageDate);

            if (!_chatMessages
                .any((message) => message.content == formatDate)) {
              _chatMessages.insert(
                0,
                ChatMessageEntity(
                  messageType: ChatMessageType.date.value,
                  content: formatDate,
                  sender: '',
                  opinionType: '',
                  userCommunity: '',
                ),
              );
            }
          }

          previousDate = chatRoomMessage.date;

          if (chatRoomMessage.hasMore) {
            _getChatRoomMessages(nextCursor: chatMessageCursor.nextCursor);
          }
        }
      },
      failure: (msg) {
        deSnackBar(msg);
      },
    );
  }

  void setChatRoomDetails(int roomId, String title) {
    _chatRoomId.value = roomId;
    _chatRoomTitle.value = title;
  }
}
