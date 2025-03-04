import 'package:debateseason_frontend_v1/features/issue/domain/entities/chat_room_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_room_res.g.dart';

@JsonSerializable()
class ChatRoomRes {
  int chatRoomId;
  String title;
  String content;
  int agree;
  int disagree;
  String createdAt;
  String opinion;

  ChatRoomRes({
    required this.chatRoomId,
    required this.title,
    required this.content,
    required this.agree,
    required this.disagree,
    required this.createdAt,
    required this.opinion,
  });

  factory ChatRoomRes.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomResToJson(this);

  ChatRoomEntity toEntity() => ChatRoomEntity(
        chatRoomId: chatRoomId,
        title: title,
        content: content,
        agree: agree,
        disagree: disagree,
        createdAt: DateTime.parse(createdAt),
        opinion: opinion,
      );
}
