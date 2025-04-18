import 'package:json_annotation/json_annotation.dart';

part 'chat_room.g.dart';

@JsonSerializable()
class ChatRoom {
  int chatRoomId;
  String title;
  String content;
  int agree;
  int disagree;
  String createdAt;
  String? opinion;

  ChatRoom({
    required this.chatRoomId,
    required this.title,
    required this.content,
    required this.agree,
    required this.disagree,
    required this.createdAt,
    required this.opinion,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);
}
