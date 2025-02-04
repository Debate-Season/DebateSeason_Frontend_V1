import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/core/services/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/repositories/chat_rooms_messages_repository.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/chat_message_type.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/opinion_type.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRoomViewModel extends GetxController {
  late StompService _stompService;
  late SharedPreferencesService _pref;
  late ChatRoomsMessagesRepository _chatRoomsMessagesRepository;

  final _chatMessages = <ChatMessageEntity>[].obs;
  final _room = Rx<RoomRes>(
    RoomRes(
      chatRoomId: -1,
      title: '',
      content: '',
      //opinion: '',
      opinion: OpinionType.neutral,
      agree: 0,
      disagree: 0,
      createdAt: '',
    ),
  );

  List<ChatMessageEntity> get chatMessages => _chatMessages;

  RoomRes get room => _room.value;

  @override
  void onInit() {
    super.onInit();

    _stompService = StompService();
    _pref = SharedPreferencesService();
    _chatRoomsMessagesRepository = Get.find<ChatRoomsMessagesRepository>();

    try {
      final Map<String, dynamic> arguments = Get.arguments;
      final RoomRes room = arguments['room'];
      _room.value = room;
      var opinion = room.opinion;
      log.d('opinion: $opinion');
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
    _stompService.connectStomp(chatRoomId: _room.value.chatRoomId);
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
      String formatOpinion = '';
      switch (_room.value.opinion) {
        case OpinionType.agree:
          formatOpinion = OpinionType.agree.value;
        case OpinionType.disagree:
          formatOpinion = OpinionType.disagree.value;
        default:
          formatOpinion = OpinionType.neutral.value;
      }

      final chatMessage = ChatMessageEntity(
        messageType: ChatMessageType.chat.value,
        content: content,
        sender: _pref.getNickname(),
        opinionType: formatOpinion,
        userCommunity: _pref.getCommunity(),
      );

      _stompService.sendStomp(
        chatRoomId: _room.value.chatRoomId,
        chatMessage: chatMessage,
      );
    } catch (e) {
      log.d("메시지 전송 중 오류 발생: $e");
    }
  }

  void _getChatRoomMessages({String? nextCursor}) async {
    final result = await _chatRoomsMessagesRepository.getChatRoomsMessages(
      roomId: _room.value.chatRoomId,
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
}
