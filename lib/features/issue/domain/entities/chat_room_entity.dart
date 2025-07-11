import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';

class ChatRoomEntity {
  int chatRoomId;
  String title;
  String content;
  int agree;
  int disagree;
  DateTime createdAt;
  OpinionType opinion;
  String time;

  ChatRoomEntity({
    required this.chatRoomId,
    required this.title,
    required this.content,
    required this.agree,
    required this.disagree,
    required this.createdAt,
    required this.opinion,
    required this.time,
  });
}
