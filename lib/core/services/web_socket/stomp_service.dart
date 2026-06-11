import 'dart:async';
import 'dart:convert';

import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/auth_reissue_repository.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class StompService {
  static final StompService _instance = StompService._internal();

  factory StompService() => _instance;

  StompService._internal();

  late StompClient stompClient;
  final _chatStream = StreamController<ChatMessageEntity>.broadcast();

  int? _chatRoomId;
  bool _hasRetriedAuth = false;

  Stream<ChatMessageEntity> get chatStream => _chatStream.stream;

  void connectStomp({
    required int chatRoomId,
    required String accessToken,
  }) {
    _chatRoomId = chatRoomId;
    stompClient = StompClient(
      config: StompConfig(
        url: dotenv.get("WEB_SOCKET_BASE_URL"),
        onConnect: (frame) {
          log.d("STOMP 연결 성공");
          _hasRetriedAuth = false;
          _subscribeStomp(chatRoomId: chatRoomId);
        },
        onWebSocketError: (error) {
          log.d("WebSocket 에러: $error");
        },
        onStompError: (frame) {
          log.d("STOMP 프로토콜 에러: ${frame.body}");
          _handleStompError(frame);
        },
        onDisconnect: (frame) {
          log.d('STOMP 연결 해제');
        },
        onWebSocketDone: () {
          log.d("WebSocket 연결 종료");
        },
        stompConnectHeaders: {
          'heart-beat': '5000,5000',
          'Authorization': accessToken,
        },
      ),
    );
    stompClient.activate();
  }

  // 인증 토큰 만료/무효 ERROR 프레임 수신 시 1회만 갱신 후 재연결.
  Future<void> _handleStompError(StompFrame frame) async {
    final body = frame.body ?? '';
    final isAuthError = body.contains('인증') || body.contains('토큰');
    if (!isAuthError || _hasRetriedAuth) return;

    _hasRetriedAuth = true;
    await _reissueAndReconnect();
  }

  Future<void> _reissueAndReconnect() async {
    final roomId = _chatRoomId;
    if (roomId == null) return;

    try {
      final storage = SecureStorageService();
      final refreshToken = await storage.getRefreshToken();
      final status = await Get.find<AuthReissueRepository>()
          .postAuthReissue(refreshToken: refreshToken);
      if (status != 200) return;

      final newToken = await storage.getAccessToken();
      if (newToken.isEmpty) return;

      disconnect();
      connectStomp(chatRoomId: roomId, accessToken: newToken);
    } catch (e, stack) {
      log.d('$e \n $stack');
    }
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
