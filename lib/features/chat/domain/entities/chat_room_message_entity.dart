import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_message_entity.freezed.dart';

@freezed
class ChatRoomMessageEntity with _$ChatRoomMessageEntity {
  factory ChatRoomMessageEntity({
    required String date,
    required List<ChatMessageEntity> messages,
    required bool hasMore,
    required int totalCount,
  }) = _ChatRoomMessageEntity;
}
