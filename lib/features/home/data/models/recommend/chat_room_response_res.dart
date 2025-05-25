import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/chat_room_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_room_response_res.g.dart';

@JsonSerializable()
class ChatRoomResponseRes {
  final int chatRoomId;
  final String title;
  final String content;
  final int agree;
  final int disagree;
  final DateTime createdAt;
  @JsonKey(fromJson: OpinionType.fromJson, toJson: OpinionType.toJsonUpper) //서버에서는 String이라고 하는데, 일단 enum으로 처리해줌
  final OpinionType opinion;

  ChatRoomResponseRes({
    required this.chatRoomId,
    required this.title,
    required this.content,
    required this.agree,
    required this.disagree,
    required this.createdAt,
    required this.opinion,
  });

  factory ChatRoomResponseRes.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomResponseResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomResponseResToJson(this);

  ChatRoomResponseEntity toEntity() => ChatRoomResponseEntity(
      chatRoomId: chatRoomId,
      title: title,
      content: content,
      agree: agree,
      disagree: disagree,
      createdAt: createdAt,
      opinion: opinion);
}
