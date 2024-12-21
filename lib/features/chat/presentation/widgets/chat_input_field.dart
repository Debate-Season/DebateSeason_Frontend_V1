import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/text_style.dart';
import '../../data/models/request/message_request.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final ChatRoomViewModel viewModel;
  const ChatInputField({super.key, required this.controller, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.all8,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: body14Sb.copyWith(color: grey10),
              decoration: const InputDecoration(
                hintText: '의견을 입력하세요...',
              ),
            ),
          ),
          Container(
            width: 48.0,
            height: 48.0,
            padding: Dimensions.all10,
            decoration: ShapeDecoration(
              color: brandColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48)
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/arrow_upward.svg',
                width: 24.0,
                height: 24.0,
              ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  String content = controller.text;
                  MessageRequest messageRequest = MessageRequest(
                    sender: 'user_id',
                    content: content,
                  );
                  viewModel.sendMessage(messageRequest);
                  controller.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
