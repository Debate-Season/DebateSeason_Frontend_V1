import 'dart:convert';

import 'package:debateseason_frontend_v1/data/models/message_model.dart';
import 'package:flutter/foundation.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class StompService {
  late StompClient stompClient;

  void connect(String userId, Function(MessageModel) onMessageReceived) {
    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: 'url~~~~~~~~~~~~~~~~~ 서버 주소',
        onConnect: (StompFrame frame) {
          stompClient.subscribe(
            destination: '/issue/messages~~~~~~~~~~~~ 구독',
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
        destination: 'chat~~~~~~ 메시지 전송 경로',
        body: jsonEncode(message.toJson()));
  }

  void disconnect() {
    stompClient.deactivate();
  }
}
