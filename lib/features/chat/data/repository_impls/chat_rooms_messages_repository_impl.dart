import 'package:debateseason_frontend_v1/features/chat/data/data_sources/chat_rooms_messages_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/mappers/chat_room_message_mapper.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_cursor_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/repositories/chat_rooms_messages_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class ChatRoomsMessagesRepositoryImpl implements ChatRoomsMessagesRepository {
  final ChatRoomsMessagesDataSource dataSource;

  ChatRoomsMessagesRepositoryImpl(this.dataSource);

  @override
  Future<UiState<ChatMessageCursorEntity>> getChatRoomsMessages({
    required int roomId,
    String? nextCursor,
  }) async {
    final response = await dataSource.getChatRoomsMessages(
      roomId: roomId,
      cursor: nextCursor == null ? null : int.tryParse(nextCursor),
    );

    switch (response.status) {
      case 200:
        return UiState.success(
          ChatRoomMessageMapper.toEntityChatMessageCursor(
            res: response.data,
          ),
        );
      default:
        if (response.message.isEmpty) {
          return UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}
