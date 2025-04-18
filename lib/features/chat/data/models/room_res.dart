import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_res.freezed.dart';
part 'room_res.g.dart';

@freezed
class RoomRes with _$RoomRes {
  const factory RoomRes({
    required int chatRoomId,
    required String title,
    required String content,
    required int agree,
    required int disagree,
    required DateTime createdAt,
    @JsonKey(fromJson: OpinionType.fromJson) required OpinionType opinion,
  }) = _RoomRes;

  factory RoomRes.fromJson(Map<String, dynamic> json) =>
      _$RoomResFromJson(json);
}
