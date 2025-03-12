import 'package:debateseason_frontend_v1/features/chat/presentation/types/opinion_type.dart';

class ChatRoomEntity {
  int chatRoomId;
  String title;
  String content;
  int agree;
  int disagree;
  DateTime createdAt;
  OpinionType opinion;

  ChatRoomEntity({
    required this.chatRoomId,
    required this.title,
    required this.content,
    required this.agree,
    required this.disagree,
    required this.createdAt,
    required this.opinion,
  });
}
