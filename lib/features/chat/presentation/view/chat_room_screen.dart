import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/core/constants/dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/gaps.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_model/chat_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_message.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_room_app_bar.dart';
import 'package:debateseason_frontend_v1/widgets/de_scaffold.dart';
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
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Row(
                children: [
                  Gaps.h12,
                  Padding(
                    padding: Dimensions.all8,
                    child: SvgPicture.asset('assets/icons/ic_back_grey50.svg'),
                  ),
                  Gaps.h4,
                ],
              ),
            ),
            title: Obx(() {
              return ChatRoomAppBar(title: controller.room.title);
            }),
            titleSpacing: 0,
            backgroundColor: grey80,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: true,
          ),
          body: _body(),
          backgroundColor: grey80,
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        // todo 바텀시트 생성되면 하단 Container 삭제. (앱바 하단 구분선 스크린 쪽으로 이동)
        Container(
          height: 1,
          color: grey70,
        ),
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
}
