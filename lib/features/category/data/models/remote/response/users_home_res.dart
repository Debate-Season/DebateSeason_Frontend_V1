import 'package:json_annotation/json_annotation.dart';

part 'users_home_res.g.dart';

@JsonSerializable()
class UsersHomeRes {
  int issueId;
  String title;
  DateTime createdAt;
  int countChatRoom;

  UsersHomeRes({
    required this.issueId,
    required this.title,
    required this.createdAt,
    required this.countChatRoom,
  });

  factory UsersHomeRes.fromJson(Map<String, dynamic> json) =>
      _$UsersHomeResFromJson(json);

  Map<String, dynamic> toJson() => _$UsersHomeResToJson(this);
}
