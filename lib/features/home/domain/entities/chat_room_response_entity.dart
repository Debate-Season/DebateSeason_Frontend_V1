import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';

class ChatRoomResponseEntity {
  final int chatRoomId;
  final String title;
  final String content;
  final int agree;
  final int disagree;
  final DateTime createdAt;
  final OpinionType opinion;

  ChatRoomResponseEntity({
  required this.chatRoomId,
  required this.title,
  required this.content,
  required this.agree,
  required this.disagree,
  required this.createdAt,
  required this.opinion,
  });
}
