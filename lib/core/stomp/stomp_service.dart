import 'dart:convert';

import 'package:debateseason_frontend_v1/data/models/message_model.dart';
import 'package:flutter/foundation.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class StompService {
  late StompClient stompClient;

  void connect(String userId, Function(MessageModel) onMessageReceived) {
    stompClient = StompClient(
      config: StompConfig.sockJS(
//        url: 'wss://localhost:8080/gs-guide-websocket',
        url: 'wss://echo.websocket.events/',
        onConnect: (StompFrame frame) {
          stompClient.subscribe(
            //destination: '/issue/chat/messages',
            destination: 'topic/message',
            callback: (frame) {
              if (frame.body != null) {
                var message = MessageModel.fromJson(jsonDecode(frame.body!));
                onMessageReceived(message);
              }
            },
          );
        },
        onWebSocketError: (dynamic error) => debugPrint(error.toString()),
      ),
    );
    stompClient.activate();
  }

  void sendMessage(MessageModel message) {
    stompClient.send(
        //destination: '/app/chat~~~~~~ 메시지 전송 경로',
        destination: '/app',
        body: jsonEncode(message.toJson()));
  }

  void disconnect() {
    stompClient.deactivate();
  }
}
