import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/de_icons.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_models/chat_room_view_model.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_message.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends GetView<ChatRoomViewModel> {
  ChatRoomScreen({super.key});

  final _chatScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DeColors.grey80,
      child: SafeArea(
        child: DeScaffold(
          appBar: _appBar(),
          body: _body(),
          backgroundColor: DeColors.grey80,
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      isBack: true,
      backgroundColor: DeColors.grey80,
      title: Obx(() {
        return Text(
          controller.room.title,
          style: DeFonts.body14Sb.copyWith(color: DeColors.grey10),
          overflow: TextOverflow.ellipsis,
        );
      }),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          color: DeColors.grey70,
          height: 1.0,
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: _chatMessages(),
        ),
        ChatInputField(
          chatRoomViewModel: controller,
        ),
        DeGaps.v12,
      ],
    );
  }

  Widget _chatMessages() {
    return Obx(() {
      var chatMessages = controller.chatMessages;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_chatScrollController.hasClients) {
          _chatScrollController.jumpTo(
            _chatScrollController.position.minScrollExtent,
          );
        }
      });

      final chattingMessageList = chatMessages.reversed.toList();

      return Align(
        alignment: Alignment.topCenter,
        child: ListView.separated(
          controller: _chatScrollController,
          itemCount: chattingMessageList.length,
          shrinkWrap: true,
          reverse: true,
          padding: DeDimensions.all20,
          itemBuilder: (context, index) {
            final chatMessage = chattingMessageList[index];

            return ChatMessage(message: chatMessage);
          },
          separatorBuilder: (context, index) => DeGaps.v16,
        ),
      );
    });
  }

  Widget _widgetCloseDebateBottomSheetBody() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            log.d('토론방 나가기');
          },
          child: Container(
            padding: DeDimensions.padding20x16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  DeIcons.ic_exit_grey10,
                  width: 24.0,
                  height: 24.0,
                ),
                DeGaps.h16,
                Expanded(
                  child: DeText(
                    '토론 종료하기',
                    style: DeFonts.body16M.copyWith(color: DeColors.grey10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
