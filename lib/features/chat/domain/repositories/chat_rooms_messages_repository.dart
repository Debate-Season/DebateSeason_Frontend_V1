import 'package:debateseason_frontend_v1/core/model/cursor_pagination_model.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class ChatRoomsMessagesRepository {
  Future<UiState<CursorPagination<ChatMessageEntity>>> getChatRoomsMessages({
    required int roomId,
    String? nextCursor,
  });
}
