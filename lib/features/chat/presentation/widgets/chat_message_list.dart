import 'package:debateseason_frontend_v1/features/chat/data/models/response/msg_new_res.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:debateseason_frontend_v1/features/chat/data/models/request/message_request.dart';
import 'message_bubble.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required int chatRoomId,
  });

  @override
  Widget build(BuildContext context) {
    final ChatRoomViewModel viewModel = Get.find<ChatRoomViewModel>();
    return Text('ChatMessageList');
    // return Obx(
    //   () => ListView.builder(
    //     itemCount: viewModel.receivedMessages.length,
    //     itemBuilder: (context, index) {
    //       MsgNewRes msgRes = viewModel.receivedMessages[index];
    //       MessageRequest messageRequest = MessageRequest(
    //         sender: msgRes.sender,
    //         content: msgRes.content,
    //       );
    //       return MessageBubble(
    //         message: messageRequest,
    //         category: msgRes.opinionType,
    //       );
    //     },
    //   ),
    // );
  }
}
