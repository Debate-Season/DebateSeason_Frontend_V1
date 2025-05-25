import 'package:debateseason_frontend_v1/features/home/domain/entities/best_issue_room_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_issue_room_res.g.dart';

@JsonSerializable()
class BestIssueRoomRes {
  final int issueId;
  final String title;
  final int countChatRoom;
  final int bookMarks;

  BestIssueRoomRes({
    required this.issueId,
    required this.title,
    required this.countChatRoom,
    required this.bookMarks,
  });

  factory BestIssueRoomRes.fromJson(Map<String, dynamic> json) =>
      _$BestIssueRoomResFromJson(json);

  Map<String, dynamic> toJson() => _$BestIssueRoomResToJson(this);

  BestIssueRoomEntity toEntity() => BestIssueRoomEntity(
      issueId: issueId,
      title: title,
      countChatRoom: countChatRoom,
      bookMarks: bookMarks);
}
