import 'package:json_annotation/json_annotation.dart';

part 'chat_msg_res.g.dart';

@JsonSerializable()
class ChatMsgRes {
  int id;
  String messageType;
  String sender;
  String content;
  String opinionType;
  String userCommunity;

  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime timeStamp;

  ChatMsgRes({
    required this.id,
    required this.messageType,
    required this.sender,
    required this.content,
    required this.opinionType,
    required this.userCommunity,
    required this.timeStamp,
  });

  factory ChatMsgRes.fromJson(Map<String, dynamic> json) =>
      _$ChatMsgResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMsgResToJson(this);

  static DateTime _dateTimeFromJson(List<dynamic> timestamp) {
    return DateTime(
      timestamp[0], // 연도
      timestamp[1] - 1, // 월 (0부터 시작하므로 -1)
      timestamp[2], // 일
      timestamp[3], // 시
      timestamp[4], // 분
      timestamp[5], // 초
      (timestamp[6] / 1000000).round(), // 밀리초
    );
  }

  static List<int> _dateTimeToJson(DateTime date) {
    return [
      date.year,
      date.month,
      date.day,
      date.hour,
      date.minute,
      date.second,
      date.millisecond * 1000000, // 나노초로 변환
    ];
  }
}
