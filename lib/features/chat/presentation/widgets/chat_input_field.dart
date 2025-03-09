import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/features/chat/chat_constants.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_models/chat_room_view_model.dart';
import 'package:debateseason_frontend_v1/widgets/de_gesture_detector.dart';
import 'package:debateseason_frontend_v1/widgets/de_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatInputField extends StatefulWidget {
  final ChatRoomViewModel chatRoomViewModel;

  const ChatInputField({
    super.key,
    required this.chatRoomViewModel,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: DeDimensions.horizontal20,
      padding: DeDimensions.vertical2,
      decoration: ShapeDecoration(
        color: DeColors.grey90,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            padding: DeDimensions.all10,
            decoration: BoxDecoration(),
            child: IconButton(
              icon: SvgPicture.asset(
                DeIcons.icAddGrey30,
                width: 24.0,
                height: 24.0,
              ),
              onPressed: () {},
            ),
          ),
          DeGaps.h12,
          Expanded(
            child: DeTextField(
              controller: _textController,
              keyboardType: TextInputType.multiline,
              style: DeFonts.body14Sb.copyWith(color: DeColors.grey10),
              minLines: 1,
              maxLines: 3,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: ChatConstants.chatInputHintText,
              ),
            ),
          ),
          DeGaps.h12,
          DeGestureDetector(
            onTap: () {
              if (_textController.text.isNotEmpty) {
                widget.chatRoomViewModel.sendMessage(
                  content: _textController.text,
                );
                _textController.clear();
              }
            },
            child: Container(
              padding: DeDimensions.all12,
              decoration: BoxDecoration(
                color: _textController.text.isEmpty
                    ? DeColors.grey90
                    : DeColors.brand,
                borderRadius: BorderRadius.circular(48.0),
              ),
              child: SvgPicture.asset(
                _textController.text.isEmpty
                    ? DeIcons.icSendGrey70
                    : DeIcons.icSendGrey10,
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
