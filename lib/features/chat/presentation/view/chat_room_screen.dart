import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_room_app_bar.dart';
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
      appBar: const ChatRoomAppBar(title: '토론철은 얼마나 대단한가'),
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
            ),),
          ),
          ChatInputField(
              controller: messageController,
              viewModel: _viewModel,
          ),
        ]
      ),
    );
  }
}
