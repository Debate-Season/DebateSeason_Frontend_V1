import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';
import 'package:debateseason_frontend_v1/features/chat/domain/enums/chat_message_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message_entity.g.dart';

@JsonSerializable()
class ChatMessageEntity {
  int id;
  @JsonKey(
      fromJson: ChatMessageType.fromJson, toJson: ChatMessageType.toJsonUpper)
  ChatMessageType messageType;
  String content;
  String sender;
  @JsonKey(fromJson: OpinionType.fromJson, toJson: OpinionType.toJsonUpper)
  OpinionType opinionType;
  String userCommunity;
  DateTime timeStamp;

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
