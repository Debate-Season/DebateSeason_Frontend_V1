import 'package:stomp_dart_client/stomp_dart_client.dart';

class StompService {
  late StompClient stompClient;

  void connect(String url, Function(StompFrame) onConnect, Function(dynamic) onError){
    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: url,
        onConnect: onConnect,
        onWebSocketError: onError,
      ),
    );
    stompClient.activate();
  }

  void subscribe(String destination, Function(String) onMessage){
    stompClient.subscribe(
      destination: destination,
      callback: (frame) => onMessage(frame.body!),
    );
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
