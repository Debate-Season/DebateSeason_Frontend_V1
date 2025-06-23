// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendRes _$RecommendResFromJson(Map<String, dynamic> json) => RecommendRes(
      breakingNews: (json['breakingNews'] as List<dynamic>)
          .map((e) => BreakingNewsRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      top5BestChatRooms: (json['top5BestChatRooms'] as List<dynamic>)
          .map((e) => BestChatRoomRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      top5BestIssueRooms: (json['top5BestIssueRooms'] as List<dynamic>)
          .map((e) => BestIssueRoomRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      chatRoomResponse: (json['chatRoomResponse'] as List<dynamic>?)
          ?.map((e) => ChatRoomResponseRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendResToJson(RecommendRes instance) =>
    <String, dynamic>{
      'breakingNews': instance.breakingNews,
      'top5BestChatRooms': instance.top5BestChatRooms,
      'top5BestIssueRooms': instance.top5BestIssueRooms,
      'chatRoomResponse': instance.chatRoomResponse,
    };
