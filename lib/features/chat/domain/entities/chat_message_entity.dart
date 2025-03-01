import 'package:json_annotation/json_annotation.dart';

part 'chat_message_entity.g.dart';

@JsonSerializable()
class ChatMessageEntity {
  int id;
  String messageType;
  String sender;
  String content;
  String opinionType;
  String userCommunity;
  String timeStamp;

  ChatMessageEntity({
    required this.id,
    required this.messageType,
    required this.sender,
    required this.content,
    required this.opinionType,
    required this.userCommunity,
    required this.timeStamp,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageEntityToJson(this);
}
