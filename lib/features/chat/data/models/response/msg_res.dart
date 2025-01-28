import 'package:json_annotation/json_annotation.dart';

part 'msg_res.g.dart';

@JsonSerializable()
class MsgRes {
  int roomId;
  String type;
  String content;
  String sender;
  String opinionType;
  String userCommunity;
  String timeStamp;

  MsgRes({
    required this.roomId,
    required this.type,
    required this.content,
    required this.sender,
    required this.opinionType,
    required this.userCommunity,
    required this.timeStamp,
  });

factory MsgRes.fromJson(Map<String, dynamic> json) =>
_$MsgResFromJson(json);

Map<String, dynamic> toJson() => _$MsgResToJson(this);
}