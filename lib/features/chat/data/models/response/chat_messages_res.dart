import 'package:json_annotation/json_annotation.dart';

part 'chat_messages_res.g.dart';

@JsonSerializable()
class ChatMessagesRes {
  int id;
  String messageType;
  String sender;
  String content;
  String opinionType;
  String userCommunity;
  String timeStamp;

  ChatMessagesRes({
    required this.id,
    required this.messageType,
    required this.sender,
    required this.content,
    required this.opinionType,
    required this.userCommunity,
    required this.timeStamp,
  });

  factory ChatMessagesRes.fromJson(Map<String, dynamic> json) =>
      _$ChatMessagesResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessagesResToJson(this);
}
