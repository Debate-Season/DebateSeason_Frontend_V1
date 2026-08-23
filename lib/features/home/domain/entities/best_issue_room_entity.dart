class BestIssueRoomEntity {
  final int issueId;
  final String title;
  //final DateTime createdAt; // todo 명세서엔 없는데, 응답에서 null로 오고있음
  final int countChatRoom;
  //final int bookMarks; // todo 즐겨찾기 기능 미구현. 화면 미사용이라 파싱 제외

  BestIssueRoomEntity({
    required this.issueId,
    required this.title,
    required this.countChatRoom,
  });
}
