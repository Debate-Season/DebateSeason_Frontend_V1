import 'package:debateseason_frontend_v1/features/chat/data/models/room_res.dart';

getPercentages(RoomRes room) {
  int total = room.agree + room.disagree;
  double agreeRatio = room.agree / total;
  double disagreeRatio = room.disagree / total;

  if (total == 0) {
    agreeRatio = 0;
    disagreeRatio = 0;
  }
  String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
  String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

  return [agreeRatioText, disagreeRatioText];
}