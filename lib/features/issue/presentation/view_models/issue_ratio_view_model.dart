import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/chat_room_res.dart';

getPercentages(ChatRoomRes chatroom) {
  int agree = chatroom.agree;
  int disagree = chatroom.disagree;
  int total = agree + disagree;
  double agreeRatio = agree / total;
  double disagreeRatio = disagree / total;

  if (total == 0) {
    agreeRatio = 0;
    disagreeRatio = 0;
  }
  String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
  String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

  return [agreeRatioText, disagreeRatioText];
}
