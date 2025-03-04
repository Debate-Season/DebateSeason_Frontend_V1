import 'package:debateseason_frontend_v1/features/issue/domain/entities/chat_room_entity.dart';

getPercentages(ChatRoomEntity chatroom) {
  int total = chatroom.agree + chatroom.disagree;
  double agreeRatio = chatroom.agree / total;
  double disagreeRatio = chatroom.disagree / total;

  if (total == 0) {
    agreeRatio = 0;
    disagreeRatio = 0;
  }
  String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
  String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

  return [agreeRatioText, disagreeRatioText];
}
