// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_issue_room_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestIssueRoomRes _$BestIssueRoomResFromJson(Map<String, dynamic> json) =>
    BestIssueRoomRes(
      issueId: (json['issueId'] as num).toInt(),
      title: json['title'] as String,
      countChatRoom: (json['countChatRoom'] as num).toInt(),
      bookMarks: (json['bookMarks'] as num).toInt(),
    );

Map<String, dynamic> _$BestIssueRoomResToJson(BestIssueRoomRes instance) =>
    <String, dynamic>{
      'issueId': instance.issueId,
      'title': instance.title,
      'countChatRoom': instance.countChatRoom,
      'bookMarks': instance.bookMarks,
    };
