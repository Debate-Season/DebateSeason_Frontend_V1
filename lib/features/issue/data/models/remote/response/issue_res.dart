import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue_res.g.dart';

@JsonSerializable()
class IssueRes {
  final String title;
  final Map<String, int> map;
  final List<ChatRoomRes> chatRoomMap;

  IssueRes({
    required this.title,
    required this.map,
    required this.chatRoomMap,
});


  factory IssueRes.fromJson(Map<String, dynamic> json) =>
      _$IssueResFromJson(json);

  Map<String, dynamic> toJson() => _$IssueResToJson(this);
}