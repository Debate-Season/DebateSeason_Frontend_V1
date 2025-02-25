import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  int id;
  String messageType;
  String sender;
  String content;
  String opinionType;
  String userCommunity;
  String timeStamp;

  ChatMessageModel({
    required this.id,
    required this.messageType,
    required this.sender,
    required this.content,
    required this.opinionType,
    required this.userCommunity,
    required this.timeStamp,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}
