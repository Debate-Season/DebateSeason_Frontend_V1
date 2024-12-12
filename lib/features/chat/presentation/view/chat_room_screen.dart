import 'package:debateseason_frontend_v1/core/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/message_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/chat_room_view_model.dart';
import 'message_bubble.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _controller = TextEditingController();
  final StompService _stompService = StompService();
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();

    _stompService.connect('your id', (message) {
      messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("토론방"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatRoomViewModel>(
              builder: (context, viewModel, child) {
                return ListView.builder(
                  itemCount: viewModel.messages.length,
                  itemBuilder: (context, index) {
                    final message = viewModel.messages[index];
                    return MessageBubble(message: message);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: "의견을 입력하세요..."),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context
                          .read<ChatRoomViewModel>()
                          .sendMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
    //throw UnimplementedError();
  }
}
