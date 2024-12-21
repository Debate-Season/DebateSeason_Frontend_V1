import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final MessageRequest message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'user_id'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: message.sender == 'user_id' ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message.content,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
