import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/core/constants/text_style.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';
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
      color: grey80,
      child: SafeArea(
        child: DeScaffold(
          appBar: _appBar(),
          body: _body(),
          backgroundColor: grey80,
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }

  DeAppBar _appBar() {
    return DeAppBar(
      isBack: true,
      backgroundColor: grey80,
      title: Obx(() {
        return Text(
          controller.room.title,
          style: body14Sb.copyWith(color: grey10),
          overflow: TextOverflow.ellipsis,
        );
      }),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          color: grey70,
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
          padding: Dimensions.all20,
          itemBuilder: (context, index) {
            final chatMessage = chattingMessageList[index];

            return ChatMessage(message: chatMessage);
          },
          separatorBuilder: (context, index) => Gaps.v16,
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
            padding: Dimensions.padding20x16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_exit_grey10.svg',
                  width: 24.0,
                  height: 24.0,
                ),
                Gaps.h16,
                Expanded(
                  child: DeText(
                    '토론 종료하기',
                    style: body16M.copyWith(color: grey10),
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
