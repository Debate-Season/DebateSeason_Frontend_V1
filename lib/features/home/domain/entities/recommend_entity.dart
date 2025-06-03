import 'package:debateseason_frontend_v1/features/home/domain/entities/best_chat_room_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/best_issue_room_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/breaking_news_entity.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/chat_room_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_entity.freezed.dart';

@freezed
class RecommendEntity with _$RecommendEntity {
  factory RecommendEntity({
    required List<BreakingNewsEntity> breakingNews,
    required List<BestChatRoomEntity> top5BestChatRooms,
    required List<BestIssueRoomEntity> top5BestIssueRooms,
    required List<ChatRoomResponseEntity>? chatRoomResponse,
  }) = _RecommendEntity;
}
