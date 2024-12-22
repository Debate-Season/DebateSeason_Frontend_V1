import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/request/message_request.dart';
import '../../data/models/response/message_response.dart';
import '../view/message_bubble.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatRoomViewModel viewModel = Get.find<ChatRoomViewModel>();

    return Obx(() => ListView.builder(
      itemCount: viewModel.receivedMessages.length,
      itemBuilder: (context, index){
        MessageResponse messageResponse = viewModel.receivedMessages[index];
        MessageRequest messageRequest = MessageRequest(
          sender: messageResponse.sender,
          content: messageResponse.content,
        );
        return MessageBubble(
          message: messageRequest,
          category: messageResponse.category,
        );
      },
    ),);
  }
}
