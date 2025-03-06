import 'package:debateseason_frontend_v1/features/issue/domain/entities/chat_room_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue_entity.freezed.dart';

@freezed
class IssueEntity with _$IssueEntity {
  factory IssueEntity({
    required String title,
    required Map<String, int> map,
    required List<ChatRoomEntity> chatRoomMap,
  }) = _IssueEntity;
}
