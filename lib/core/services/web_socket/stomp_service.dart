import 'dart:async';
import 'dart:convert';

import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class StompService {
  static final StompService _instance = StompService._internal();

  factory StompService() => _instance;

  StompService._internal();

  late StompClient stompClient;
  final _chatStream = StreamController<ChatMessageEntity>.broadcast();

  Stream<ChatMessageEntity> get chatStream => _chatStream.stream;

  void connectStomp({required int chatRoomId}) {
    stompClient = StompClient(
      config: StompConfig(
        url: dotenv.get("WEB_SOCKET_BASE_URL"),
        onConnect: (frame) {
          log.d("STOMP 연결 성공");
          _subscribeStomp(chatRoomId: chatRoomId);
        },
        onWebSocketError: (error) {
          log.d("WebSocket 에러: $error");
        },
        onStompError: (frame) {
          log.d("STOMP 프로토콜 에러: ${frame.body}");
        },
        onDisconnect: (frame) {
          log.d('STOMP 연결 해제');
        },
        onWebSocketDone: () {
          log.d("WebSocket 연결 종료");
        },
        stompConnectHeaders: {
          'heart-beat': '5000,5000',
        },
      ),
    );
    stompClient.activate();
  }

  void _subscribeStomp({required int chatRoomId}) {
    try {
      stompClient.subscribe(
        destination: '/topic/room$chatRoomId',
        callback: (frame) {
          log.d('[Stomp Receive]\nroomId : $chatRoomId\n${frame.body}');
          if (frame.body != null) {
            final chatMessage = ChatMessageEntity.fromJson(
              jsonDecode(frame.body!),
            );
            _chatStream.add(chatMessage);
          }
        },
      );
    } catch (e, stack) {
      log.d('$e \n $stack');
    }
  }

  void sendStomp({
    required int chatRoomId,
    required ChatMessageEntity chatMessage,
  }) {
    try {
      final jsonChatMessage = jsonEncode(chatMessage.toStompMessage());
      log.d('[Stomp Send]\nroomId : $chatRoomId\n$jsonChatMessage');
      stompClient.send(
        destination: '/stomp/chat.room.$chatRoomId',
        body: jsonChatMessage,
      );
    } catch (e, stack) {
      log.d('$e \n $stack');
    }
  }

  void disconnect() {
    try {
      stompClient.deactivate();
    } catch (e, stack) {
      log.d('$e \n $stack');
    }
  }
}
