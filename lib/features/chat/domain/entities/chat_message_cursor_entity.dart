import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_room_message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_cursor_entity.freezed.dart';

@freezed
class ChatMessageCursorEntity with _$ChatMessageCursorEntity {
  factory ChatMessageCursorEntity({
    required List<ChatRoomMessageEntity> chatRoomMessages,
    required String? nextCursor,
  }) = _ChatMessageCursorEntity;
}
