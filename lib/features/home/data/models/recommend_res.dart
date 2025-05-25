import 'package:debateseason_frontend_v1/features/home/data/models/recommend/best_chat_room_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/breaking_news_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/recommend/best_issue_room_res.dart';
import 'package:debateseason_frontend_v1/features/home/data/models/recommend/chat_room_response_res.dart';
import 'package:debateseason_frontend_v1/features/home/domain/entities/recommend_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommend_res.g.dart';

@JsonSerializable()
class RecommendRes {
  final List<BreakingNewsRes> breakingNews;
  final List<BestChatRoomRes> top5BestChatRooms;
  final List<BestIssueRoomRes> top5BestIssueRooms;
  final List<ChatRoomResponseRes>? chatRoomResponse;

  RecommendRes({
    required this.breakingNews,
    required this.top5BestChatRooms,
    required this.top5BestIssueRooms,
    this.chatRoomResponse,
  });
  
  factory RecommendRes.fromJson(Map<String, dynamic> json) =>
      _$RecommendResFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendResToJson(this);

  RecommendEntity toEntity() => RecommendEntity(
    breakingNews: breakingNews.map((e) => e.toEntity()).toList(),
    top5BestChatRooms: top5BestChatRooms.map((e) => e.toEntity()).toList(),
    top5BestIssueRooms: top5BestIssueRooms.map((e) => e.toEntity()).toList(),
    chatRoomResponse: chatRoomResponse?.map((e) => e.toEntity()).toList(),
  );
}
