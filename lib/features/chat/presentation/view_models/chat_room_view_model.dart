import 'package:debateseason_frontend_v1/core/model/cursor_pagination_model.dart';
import 'package:debateseason_frontend_v1/core/services/shared_preferences_service.dart';
import 'package:debateseason_frontend_v1/core/services/web_socket/stomp_service.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/chat_message_model.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/enums/chat_message_type.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/repositories/chat_rooms_messages_repository.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/chat_message_type.dart';
import 'package:debateseason_frontend_v1/utils/de_snack_bar.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class ChatRoomViewModel extends GetxController {
  final StompService _stompService = StompService();
  final SharedPreferencesService _pref = SharedPreferencesService();
  final ChatRoomsMessagesRepository _chatRoomsMessagesRepository =
      Get.find<ChatRoomsMessagesRepository>();

  final _chatMessages = <ChatMessageEntity>[].obs;
  var state = Rx<CursorPaginationBase>(CursorPaginationLoading());

  late final Rx<RoomRes> _room;

  List<ChatMessageEntity> get chatMessages => _chatMessages;

  RoomRes get room => _room.value;

  @override
  void onInit() {
    super.onInit();

    try {
      final Map<String, dynamic> arguments = Get.arguments;
      _room = Rx<RoomRes>(arguments['room']);

      log.d('opinion: ${room.opinion}');
    } catch (e) {
      log.d('에러: $e');
    }
    fetchMessages(init: true);
    initializeStomp();
  }

  @override
  void onClose() {
    _stompService.disconnect();
    super.onClose();
  }

  void initializeStomp() {
    // connect
    _stompService.connectStomp(chatRoomId: _room.value.chatRoomId);
    _stompService.chatStream.listen(
      (chatMessage) {
        // TODO:
        // ChatMessageEntity 를 ChatMessageModel 로 변환해야함.
        // ChatMessageEntity 에는 Id 가 없음.
        // id 가 없으면 메시지 식별이 불가해서 추후 추가적인 적용에 어려움이 있을 것으로 보임.
        // ChatMessageEntity;
        // CursorPagination<ChatMessageModel>;
        // 위 해결될 경우 변경될 사항
        if (state.value is CursorPagination) {
          state.value = (state.value as CursorPagination<ChatMessageModel>)
              .copyWith(data: [
            ChatMessageModel(
              id: 99999,
              messageType: chatMessage.messageType,
              sender: chatMessage.sender,
              content: chatMessage.content,
              opinionType: chatMessage.opinionType,
              userCommunity: chatMessage.userCommunity,
              timeStamp: chatMessage.timeStamp.toString(),
            ),
            ...(state.value as CursorPagination).data,
          ]);
        }
      },
      onError: (error) => log.d("Error subscribe: $error"),
      onDone: () => log.d("Stream closed."),
      cancelOnError: false,
    );
  }

  void sendMessage(String content) {
    try {
      final chatMessage = ChatMessageEntity(
        messageType: ChatMessageType.chat.value,
        content: content,
        sender: _pref.getNickname(),
        opinionType: _room.value.opinion,
        userCommunity: _pref.getCommunity(),
      );

      _stompService.sendStomp(
        chatRoomId: _room.value.chatRoomId,
        chatMessage: chatMessage,
      );
    } catch (e) {
      log.d("메시지 전송 중 오류 발생: $e");
    }
  }

  Future<void> fetchMessages({bool init = false}) async {
    // 1) CursorPagination - 정상적으로 데이터가 있는 상태
    // 2) CursorPaginationLoading - 데이터가 로딩중인 상태 (현재 캐시 없음)
    // 3) CursorPaginationError - 에러가 있는 상태
    // 4) CursorPaginationRefetching - 첫번째 페이지부터 다시 데이터를 가져올때
    // 5) CursorPaginationFetchMore - 추가 데이터를 paginate 해오라는 요청을 받았을때

    // 로딩된 이후 더이상 받을 값이 없는 것을 알고 있다면 바로 반환
    if (state.value is CursorPagination) {
      final pState = state.value as CursorPagination;
      if (!pState.meta.hasMore) {
        return;
      }
    }

    final isLoading = state.value is CursorPaginationLoading;
    final isFetchingMore = state.value is CursorPaginationFetchingMore;

    // 처음 로딩중이거나 이미 로딩하고 있을 때는 바로 반환
    if (!init && (isLoading || isFetchingMore)) {
      return;
    }

    // 로딩 중이 아닐경우, Fetch 로 상태 업데이트
    log.d(isLoading);
    if (!isLoading) {
      final pState = state.value as CursorPagination<ChatMessageModel>;

      state.value = CursorPaginationFetchingMore(
        meta: pState.meta,
        data: pState.data,
      );
    }

    final nextCursor = (state.value is CursorPaginationFetchingMore)
        ? (state.value as CursorPaginationFetchingMore).meta.nextCursor
        : null;

    // 서버에 추가 데이터 요청
    final resp = await _chatRoomsMessagesRepository.getChatRoomsMessages(
      roomId: _room.value.chatRoomId,
      nextCursor: nextCursor,
    );

    resp.when(
      loading: () {},
      success: (pstate) {
        if (!isLoading) {
          state.value = pstate.copyWith(
            data: [
              ...pstate.data,
              ...(state.value as CursorPaginationFetchingMore).data,
            ],
          );
        } else {
          state.value = pstate;
        }
      },
      failure: (msg) {
        deSnackBar(msg);
        state.value = CursorPaginationError();
      },
    );
  }
}
