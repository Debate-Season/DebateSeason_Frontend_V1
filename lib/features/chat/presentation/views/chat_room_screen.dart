import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';
import 'package:debateseason_frontend_v1/core/constants/de_dimensions.dart';
import 'package:debateseason_frontend_v1/core/constants/de_fonts.dart';
import 'package:debateseason_frontend_v1/core/constants/de_gaps.dart';
import 'package:debateseason_frontend_v1/core/model/cursor_pagination_model.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/view_models/chat_room_view_model.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/widgets/chat_message.dart';
import 'package:debateseason_frontend_v1/utils/date_format_util.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:debateseason_frontend_v1/widgets/import_de.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 메시지 로딩 후 가장 아래로 스크롤
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(
          scrollController.position.minScrollExtent,
        );
      }
    });

    scrollController.addListener(scrollListner);
  }

  void scrollListner() {
    final viewModel = Get.find<ChatRoomViewModel>();

    log.d(scrollController.offset);
    if (scrollController.offset >
        scrollController.position.maxScrollExtent - 300) {
      log.d('FETCH MORE');
      viewModel.fetchMessages();
    }
  }

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
    final viewModel = Get.find<ChatRoomViewModel>();

    return DeAppBar(
      isBack: true,
      backgroundColor: DeColors.grey80,
      title: Obx(
        () => Text(
          viewModel.room.title,
          style: DeFonts.body14Sb.copyWith(color: DeColors.grey10),
          overflow: TextOverflow.ellipsis,
        );
      }),
      isCenter: false,
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
    final viewModel = Get.find<ChatRoomViewModel>();

    return Column(
      children: [
        Expanded(
          child: _chatMessages(),
        ),
        ChatInputField(
          sendMessage: viewModel.sendMessage,
        ),
        DeGaps.v12,
      ],
    );
  }

  Widget _chatMessages() {
    final viewModel = Get.find<ChatRoomViewModel>();

    return Obx(() {
      // final chattingMessageList = controller.chatMessages.reversed.toList();

      final cursorState = viewModel.state.value;
      if (cursorState is CursorPaginationLoading) {
        return Center(child: CircularProgressIndicator());
      }

      // TODO : CursorPagination Error 구현 필요

      // CursorPagination
      // CursorPaginationFetching

      final List<ChatMessageEntity> chattingMessageList =
          (cursorState as CursorPagination).data.cast<ChatMessageEntity>();

      return Align(
        alignment: Alignment.topCenter,
        child: ListView.separated(
          controller: scrollController,
          itemCount: chattingMessageList.length + 1,
          shrinkWrap: true,
          reverse: true,
          padding: DeDimensions.all20,
          itemBuilder: (context, index) {
            // 추가 데이터를 Fetch 할 때, 상단 로딩바
            if (index == chattingMessageList.length) {
              return Center(
                child: cursorState is CursorPaginationFetchingMore
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox.shrink(),
              );
            }

            final ChatMessageEntity chatMessageModel =
                chattingMessageList[index];

            // dataline 여부 확인
            bool withDateLine;
            if (index == 0) {
              withDateLine = false;
            } else {
              final currentTime = DateTime.parse(chatMessageModel.timeStamp);
              final prevTIme =
                  DateTime.parse(chattingMessageList[index - 1].timeStamp);
              withDateLine = !DateFormatUtil.isSameDate(currentTime, prevTIme);
            }
            return ChatMessage(chatMessageModel, withDateLine: withDateLine);
          },
          separatorBuilder: (context, index) => DeGaps.v16,
        ),
      );
    });
  }

/*Widget _widgetCloseDebateBottomSheetBody() {
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
  }*/
}
