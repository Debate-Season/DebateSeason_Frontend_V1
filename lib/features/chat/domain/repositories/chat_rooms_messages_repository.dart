import 'package:debateseason_frontend_v1/core/model/cursor_pagination_model.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/chat_message_model.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class ChatRoomsMessagesRepository {
  Future<UiState<CursorPagination<ChatMessageModel>>> getChatRoomsMessages({
    required int roomId,
    String? nextCursor,
  });
}
