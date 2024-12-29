import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../utils/logger.dart';

class StompService {
  late StompClient stompClient;

  void connect(String url, Function(StompFrame) onConnect, Function(dynamic) onError){
    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: url,
        // onConnect: onConnect,
        // onWebSocketError: onError,
        onConnect: (frame) {
          log.d("STOMP 연결 성공: ${frame.headers}");
          onConnect(frame);
        },
        onWebSocketError: (error) {
          log.d("WebSocket 에러: $error");
          onError(error);
        },
        onStompError: (frame) {
          log.d("STOMP 프로토콜 에러: ${frame.body}");
        },
        onDisconnect: (frame) {
          log.d("STOMP 연결 해제: ${frame.headers}");
        },
        onWebSocketDone: () {
          log.d("WebSocket 연결 종료");
        },
      ),
    );
    stompClient.activate();
    log.d("STOMP 클라이언트 활성화...");
  }

  void subscribe(String destination, Function(String) onMessage){
    log.d('* 구독 시도: $destination');
    try {
      stompClient.subscribe(
          destination: destination,
          //callback: (frame) => onMessage(frame.body!),
          callback: (frame) {
            log.d('* 구독 성공: $destination, 받은 메시지: ${frame.body}');
            onMessage(frame.body ?? "");
          }
      );
    } catch (e){
      log.d('* 구독 실패: $e');
    }
  }

  void sendMessage(String destination, String message) {
    stompClient.send(
        destination: destination,
        body: message,
    );
  }

  void disconnect() {
    stompClient.deactivate();
  }
}
