import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_entity.freezed.dart';

part 'chat_message_entity.g.dart';

@freezed
class ChatMessageEntity with _$ChatMessageEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChatMessageEntity({
    required String messageType,
    required String content,
    required String sender,
    required String opinionType,
    required String userCommunity,
  }) = _ChatMessageEntity;

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageEntityFromJson(json);
}
