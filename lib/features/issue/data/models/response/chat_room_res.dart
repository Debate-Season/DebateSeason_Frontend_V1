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
  String? opinion;

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
}
