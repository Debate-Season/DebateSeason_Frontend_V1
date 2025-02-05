import 'package:debateseason_frontend_v1/features/chat/data/models/response/chat_messages_res.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/chat_room_messages_res.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_cursor_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_message_entity.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/entities/chat_room_message_entity.dart';

class ChatRoomMessageMapper {
  static ChatMessageCursorEntity toEntityChatMessageCursor({
    required ChatRoomsMessagesRes res,
  }) {
    return ChatMessageCursorEntity(
      chatRoomMessages: toEntityChatRoomMessage(res: res.messagesByDates),
      nextCursor: res.nextCursor,
    );
  }

  static List<ChatRoomMessageEntity> toEntityChatRoomMessage({
    required List<MessagesByDates> res,
  }) {
    return res.map((messagesByDates) {
      return ChatRoomMessageEntity(
        date: messagesByDates.date,
        messages: messagesByDates.chatMessageResponses.map((chatMessageRes) {
          return toEntityChatMessage(res: chatMessageRes);
        }).toList(),
        hasMore: messagesByDates.hasMore,
        totalCount: messagesByDates.totalCount,
      );
    }).toList();
  }

  static ChatMessageEntity toEntityChatMessage({required ChatMessagesRes res}) {
    return ChatMessageEntity(
      messageType: res.messageType,
      content: res.content,
      sender: res.sender,
      opinionType: res.opinionType,
      userCommunity: res.userCommunity,
      timeStamp: DateTime.tryParse(res.timeStamp),
    );
  }
}
