// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueRes _$IssueResFromJson(Map<String, dynamic> json) => IssueRes(
      title: json['title'] as String,
      map: Map<String, int>.from(json['map'] as Map),
      chatRoomMap: (json['chatRoomMap'] as List<dynamic>)
          .map((e) => ChatRoomRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IssueResToJson(IssueRes instance) => <String, dynamic>{
      'title': instance.title,
      'map': instance.map,
      'chatRoomMap': instance.chatRoomMap,
    };
