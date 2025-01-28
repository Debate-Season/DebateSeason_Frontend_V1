import 'package:json_annotation/json_annotation.dart';

import 'chat_msg_res.dart';

part 'msg_new_res.g.dart';

@JsonSerializable()
class MsgNewRes {
  String date;
  List<ChatMsgRes> chatMsgRes;

  MsgNewRes({
    required this.date,
    required this.chatMsgRes,
  });

  factory MsgNewRes.fromJson(Map<String, dynamic> json) =>
      _$MsgNewResFromJson(json);

  Map<String, dynamic> toJson() => _$MsgNewResToJson(this);
}

// class ChatMessageResponses {
//   int id;
//   String messageType;
//   String sender;
//   String content;
//   String opinionType;
//   String userCommunity;
//   List<int> timeStamp;
//
//   ChatMessageResponses({
//     required this.id,
//     required this.messageType,
//     required this.sender,
//     required this.content,
//     required this.opinionType,
//     required this.userCommunity,
//     required this.timeStamp,
//   });
//
//   factory ChatMessageResponses.fromJson(Map<String, dynamic> json) =>
//       _$ChatMessageResponsesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ChatMessageResponsesToJson(this);
// }