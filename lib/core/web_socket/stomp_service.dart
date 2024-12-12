import 'dart:convert';

import 'package:debateseason_frontend_v1/features/chat/data/models/response/message_model.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class StompService {
  late StompClient stompClient;

  void connect(String userId, Function(MessageModel) onMessageReceived) {
    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: "ws://www.debate-season.click/ws-stomp",

        onConnect: (StompFrame frame) {
          stompClient.subscribe(
            destination: '/topic/room1',
            callback: (frame) {
              log.d('커넥션');
              if (frame.body != null) {
                var message = MessageModel.fromJson(jsonDecode(frame.body!));
                onMessageReceived(message);
              }
            },
          );
        },
        onWebSocketError: (dynamic error) => log.d(error.toString()),
      ),
    );
    stompClient.activate();
  }

  void sendMessage(MessageModel message) {
    stompClient.send(
        destination: '/app/chat.sendMessage',
        body: jsonEncode(message.toJson()));
  }

  void disconnect() {
    stompClient.deactivate();
  }
}
