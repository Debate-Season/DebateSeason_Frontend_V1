import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("토론방"),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: Consumer<ChatRoomViewModel>(
          //     builder: (context, viewModel, child) {
          //       return ListView.builder(
          //         itemCount: viewModel.messages.length,
          //         itemBuilder: (context, index) {
          //           final message = viewModel.messages[index];
          //           return MessageBubble(message: message);
          //         },
          //       );
          //     },
          //   ),
          // ),
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
                      // context
                      //     .read<ChatRoomViewModel>()
                      //     .sendMessage(_controller.text);
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
