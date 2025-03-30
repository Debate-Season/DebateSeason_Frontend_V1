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
    int? nextCursor,
  }) async {
    // Fetch Raw
    final rawResponse = await dataSource.getChatRoomsMessages(
      roomId: roomId,
      cursor: nextCursor,
    );

    final response = BaseRes<CursorPagination<ChatMessageEntity>>(
      status: rawResponse.status,
      code: rawResponse.code,
      message: rawResponse.message,
      data: CursorPagination<ChatMessageEntity>(
        meta: CursorPaginationMeta(
            nextCursor: rawResponse.data.nextCursor,
            hasMore: rawResponse.data.hasMore),
        data: rawResponse.data.items,
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
