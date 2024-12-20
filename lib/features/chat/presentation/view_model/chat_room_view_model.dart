import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/message_model.dart';
import 'package:flutter/material.dart';

class ChatRoomViewModel with ChangeNotifier {
  final StompService _stompService = StompService();
  List<MessageModel> messages = [];

  ChatRoomViewModel() {
    _stompService.connect('your id', (message) {
      messages.add(message);
      notifyListeners();
    });
  }

  void sendMessage(String content) {
    var message = MessageModel(
      sender: 'your id',
      category: 'category',
      content: content,
      //timestamp: DateTime.now(),
    );
    _stompService.sendMessage(message);
    messages.add(message);
    notifyListeners();
  }

  @override
  void dispose() {
    _stompService.disconnect();
    super.dispose();
  }
}
