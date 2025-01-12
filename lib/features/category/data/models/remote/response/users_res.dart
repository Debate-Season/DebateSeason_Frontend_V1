import 'package:json_annotation/json_annotation.dart';

part 'users_res.g.dart';

@JsonSerializable()
class UsersRes {
  int issueId;
  String title;
  String createdAt;
  int countChatRoom;

  UsersRes({
    required this.issueId,
    required this.title,
    required this.createdAt,
    required this.countChatRoom,
  });

  factory UsersRes.fromJson(Map<String, dynamic> json) =>
      _$UsersResFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResToJson(this);
}
