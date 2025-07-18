import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';
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
  String time;

  ChatRoomRes({
    required this.chatRoomId,
    required this.title,
    required this.content,
    required this.agree,
    required this.disagree,
    required this.createdAt,
    required this.opinion,
    required this.time,
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
        opinion: _getOpinion(opinion),
        time: time,
      );

  OpinionType _getOpinion(String opn) {
    switch (opn.toUpperCase()) {
      case 'AGREE':
        return OpinionType.agree;
      case 'DISAGREE':
        return OpinionType.disagree;
      case 'NEUTRAL':
        return OpinionType.neutral;
      default:
        return OpinionType.neutral;
    }
  }
}
