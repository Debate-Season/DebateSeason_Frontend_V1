class BestIssueRoomEntity {
  final int issueId;
  final String title;
  //final DateTime createdAt; // todo 명세서엔 없는데, 응답에서 null로 오고있음
  final int countChatRoom;
  final int bookMarks;

  BestIssueRoomEntity({
    required this.issueId,
    required this.title,
    required this.countChatRoom,
    required this.bookMarks,
  });
}
