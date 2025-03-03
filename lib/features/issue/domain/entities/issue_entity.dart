import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue_entity.freezed.dart';

@freezed
class IssueEntity with _$IssueEntity {
  factory IssueEntity({
    required String title,
    required Map<String, int> map,
    required List<ChatRoomRes> chatRoomMap,
  }) = _IssueEntity;
}
