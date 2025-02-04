import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_cursor_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class ChatRoomsMessagesRepository {
  Future<UiState<ChatMessageCursorEntity>> getChatRoomsMessages({
    required int roomId,
    String? nextCursor,
  });
}
