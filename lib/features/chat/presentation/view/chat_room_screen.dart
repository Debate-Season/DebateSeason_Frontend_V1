import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_message_list.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_room_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/color.dart';
import '../view_model/chat_room_view_model.dart';

class ChatRoomScreen extends GetView<ChatRoomViewModel>{
  final ChatRoomViewModel _viewModel = Get.find<ChatRoomViewModel>();

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      backgroundColor: grey80,
      appBar: const ChatRoomAppBar(title: '토론철은 얼마나 대단한가'),
      body: Column(
        children: [
          Expanded(
            child: ChatMessageList(),
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
