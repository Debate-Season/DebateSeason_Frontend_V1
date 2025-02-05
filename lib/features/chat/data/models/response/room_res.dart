import 'package:debateseason_frontend_v1/features/chat/presentation/types/opinion_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_res.g.dart';

@JsonSerializable()
class RoomRes {
  int chatRoomId;
  String title;
  String content;
  int agree;
  int disagree;
  String createdAt;
  String opinion;

   RoomRes({
    required this.chatRoomId,
    required this.title,
    required this.content,
    required this.agree,
    required this.disagree,
    required this.createdAt,
    required this.opinion,
  });

  factory RoomRes.fromJson(Map<String, dynamic> json) =>
      _$RoomResFromJson(json);

  Map<String, dynamic> toJson() => _$RoomResToJson(this);
}