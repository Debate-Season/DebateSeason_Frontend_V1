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
  const ChatRoomScreen({super.key});

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
                title: controller.chatRoomTitle.isNotEmpty
                    ? controller.chatRoomTitle
                    : '토론방 로딩 중');
          }),
          Obx(() {
            return Expanded(
              child: _chatMessages(),
            );
          }),
          ChatInputField(
            chatRoomViewModel: controller,
          ),
        ],
      ),
    );
  }

  Widget _chatMessages() {
    return Obx(() {
      final chatMessages = controller.chatMessages;
      // 더미데이터
      // final chatMessages = [
      //   ChatMessageEntity(
      //     messageType: 'CHAT',
      //     content: '안녕1',
      //     sender: '홍건적',
      //     opinionType: 'AGREE',
      //     userCommunity: '에펨코리아',
      //     timeStamp: DateTime.now(),
      //   ),
      //   ChatMessageEntity(
      //     messageType: 'CHAT',
      //     content: '안녕2',
      //     sender: '홍건적',
      //     opinionType: 'DISAGREE',
      //     userCommunity: '에펨코리아',
      //     timeStamp: DateTime.now(),
      //   ),
      //   ChatMessageEntity(
      //     messageType: 'CHAT',
      //     content: '안녕3',
      //     sender: '홍건적',
      //     opinionType: 'AGREE',
      //     userCommunity: '에펨코리아',
      //     timeStamp: DateTime.now(),
      //   ),
      //   ChatMessageEntity(
      //     messageType: 'CHAT',
      //     content: '안녕4',
      //     sender: '홍건적',
      //     opinionType: 'AGREE',
      //     userCommunity: '에펨코리아',
      //     timeStamp: DateTime.now(),
      //   ),
      //   ChatMessageEntity(
      //     messageType: 'CHAT',
      //     content: '안녕5',
      //     sender: '홍건적',
      //     opinionType: 'AGREE',
      //     userCommunity: '에펨코리아',
      //     timeStamp: DateTime.now(),
      //   ),
      //   ChatMessageEntity(
      //     messageType: 'CHAT',
      //     content: '안녕6',
      //     sender: '홍건적',
      //     opinionType: 'DISAGREE',
      //     userCommunity: '에펨코리아',
      //     timeStamp: DateTime.now(),
      //   ),
      // ];
      return ListView.separated(
        itemCount: chatMessages.length,
        itemBuilder: (context, index) {
          final chatMessage = chatMessages[index];

          return ChatMessage(message: chatMessage);
        },
        separatorBuilder: (context, index) => Gaps.v16,
      );
    });
  }
}
