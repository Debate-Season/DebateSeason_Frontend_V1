import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_message.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_room_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends GetView<ChatRoomViewModel> {
  ChatRoomScreen({super.key});

  final _chatScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DeScaffold(
      body: _body(),
      backgroundColor: grey80,
    );
  }

  Widget _body() {
    return Padding(
      padding: Dimensions.all20,
      child: Column(
        children: [
          Obx(() {
            return ChatRoomAppBar(
              title: controller.room.title.isNotEmpty
                  ? controller.room.title
                  : '토론방 로딩 중',
            );
          }),
          Expanded(child: _chatMessages()),
          ChatInputField(
            chatRoomViewModel: controller,
          ),
        ],
      ),
    );
  }

  Widget _chatMessages() {
    return Obx(() {
      var chatMessages = controller.chatMessages;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_chatScrollController.hasClients) {
          _chatScrollController.jumpTo(
            _chatScrollController.position.maxScrollExtent + 30,
          );
        }
      });

      return ListView.separated(
        controller: _chatScrollController,
        itemCount: chatMessages.length,
        shrinkWrap: true,
        padding: Dimensions.vertical20,
        itemBuilder: (context, index) {
          final chatMessage = chatMessages[index];

          return ChatMessage(message: chatMessage);
        },
        separatorBuilder: (context, index) => Gaps.v16,
      );
    });
  }
}
