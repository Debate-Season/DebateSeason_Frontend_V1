import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_message_list.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_room_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';

class ChatRoomScreen extends GetView<ChatRoomViewModel> {
  final ChatRoomViewModel _viewModel = Get.find<ChatRoomViewModel>();

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: grey80,
        body: Padding(
          padding: Dimensions.all20,
          child: Column(
            children: [
              Obx(() {
                return ChatRoomAppBar(
                    title:
                    _viewModel.chatRoomTitle.value.isNotEmpty ? _viewModel.chatRoomTitle.value : '토론방 로딩 중');
              }),
              Obx(() {
                return Expanded(
                  child: ChatMessageList(chatRoomId: _viewModel.chatRoomId.value),
                );
              }),
              ChatInputField(
                controller: messageController,
                viewModel: _viewModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
