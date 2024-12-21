import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/response/message_response.dart';
import '../view_model/chat_room_view_model.dart';
import 'message_bubble.dart';

class ChatRoomScreen extends GetView<ChatRoomViewModel>{
  final ChatRoomViewModel _viewModel = Get.find<ChatRoomViewModel>();

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("토론방"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: _viewModel.receivedMessages.length,
              itemBuilder: (context, index){
                MessageResponse messageResponse = _viewModel.receivedMessages[index];
                MessageRequest messageRequest = MessageRequest(
                  sender: messageResponse.sender,
                  content: messageResponse.content,
                );
                return MessageBubble(message: messageRequest);
              },
            ),),),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(labelText: "의견을 입력하세요..."),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      String content = messageController.text;
                      MessageRequest messageRequest = MessageRequest(
                        sender: 'user_id',
                        content: content,
                      );
                      _viewModel.sendMessage(messageRequest);
                      messageController.clear();
                    }
                  },
                ),
              ]
            ),
          ),
        ]
      ),
    );
  }

}
// class ChatRoomScreen extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("토론방"),
//       ),
//       body: Column(
//         children: [
//           // Expanded(
//           //   child: Consumer<ChatRoomViewModel>(
//           //     builder: (context, viewModel, child) {
//           //       return ListView.builder(
//           //         itemCount: viewModel.messages.length,
//           //         itemBuilder: (context, index) {
//           //           final message = viewModel.messages[index];
//           //           return MessageBubble(message: message);
//           //         },
//           //       );
//           //     },
//           //   ),
//           // ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(labelText: "의견을 입력하세요..."),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     if (_controller.text.isNotEmpty) {
//                       // context
//                       //     .read<ChatRoomViewModel>()
//                       //     .sendMessage(_controller.text);
//                       _controller.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//     //throw UnimplementedError();
//   }
// }
