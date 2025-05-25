import 'package:debateseason_frontend_v1/features/home/domain/entities/best_chat_room_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_chat_room_res.g.dart';

@JsonSerializable()
class BestChatRoomRes {
  final int issueId;
  final String issueTitle;
  final int debateId;
  final String debateTitle;
  final String time;

  BestChatRoomRes({
    required this.issueId,
    required this.issueTitle,
    required this.debateId,
    required this.debateTitle,
    required this.time,
  });

  factory BestChatRoomRes.fromJson(Map<String, dynamic> json) =>
      _$BestChatRoomResFromJson(json);

  Map<String, dynamic> toJson() => _$BestChatRoomResToJson(this);

  BestChatRoomEntity toEntity() => BestChatRoomEntity(
      issueId: issueId,
      issueTitle: issueTitle,
      debateId: debateId,
      debateTitle: debateTitle,
      time: time);
}
