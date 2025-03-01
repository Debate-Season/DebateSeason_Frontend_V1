import 'package:debateseason_frontend_v1/core/model/cursor_pagination_model.dart';
import 'package:debateseason_frontend_v1/features/chat/data/data_sources/chat_rooms_messages_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/repositories/chat_rooms_messages_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class ChatRoomsMessagesRepositoryImpl implements ChatRoomsMessagesRepository {
  final ChatRoomsMessagesDataSource dataSource;

  ChatRoomsMessagesRepositoryImpl(this.dataSource);

  @override
  Future<UiState<CursorPagination<ChatMessageEntity>>> getChatRoomsMessages({
    required int roomId,
    String? nextCursor,
  }) async {
    // Fetch Raw
    final rawRepsonse = await dataSource.getRawChatRoomsMessages(
      roomId: roomId,
      cursor: nextCursor == null ? null : int.tryParse(nextCursor),
    );

    // Map Raw Data to Inner Model
    List<MessagesByDates> messagesByDates = rawRepsonse.data.messagesByDates;
    List<ChatMessageEntity> chatMessages = [];

    for (var dateEntry in messagesByDates) {
      chatMessages.addAll(dateEntry.chatMessageResponses);
    }

    final response = BaseRes<CursorPagination<ChatMessageEntity>>(
      status: rawRepsonse.status,
      code: rawRepsonse.code,
      message: rawRepsonse.message,
      data: CursorPagination<ChatMessageEntity>(
        meta: CursorPaginationMeta(
            nextCursor: rawRepsonse.data.nextCursor,
            hasMore: rawRepsonse.data.hasMore),
        data: chatMessages,
      ),
    );

    // handle response
    switch (response.status) {
      case 200:
        return UiState.success(response.data);
      default:
        return UiState.failure(
            response.message.isEmpty ? "서버 통신에 문제가 발생했습니다" : response.message);
    }
  }
}
