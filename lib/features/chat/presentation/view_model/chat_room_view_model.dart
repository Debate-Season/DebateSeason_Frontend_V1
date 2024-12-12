import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:flutter/material.dart';

import '../../data/models/response/message_model.dart';

class ChatRoomViewModel with ChangeNotifier {
  final StompService _stompService = StompService();
  List<MessageModel> messages = [];

  ChatRoomViewModel();

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
