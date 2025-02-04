import 'package:debateseason_frontend_v1/features/chat/data/data_sources/room_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/data_sources/vote_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class DebateRoomViewModel extends GetxController {
  late RoomDataSource _roomDataSource; // todo 여기 final 쓰면 오류 발생
  final Rx<RoomRes?> _roomData = Rx<RoomRes?>(null);

  RoomRes? get roomData => _roomData.value;

  late VoteDataSource _voteDataSource;
  final Rx<String?> _voteData = Rx<String?>(null);

  String? get voteData => _voteData.value;

  var voteStatus = ''.obs;
  final _issueTitle = ''.obs;

  String? get issueTitle => _issueTitle.value;

  void updateVoteStatus(String newOpinion) {
    voteStatus.value = newOpinion;
  }

  @override
  void onInit() {
    super.onInit();
    _roomDataSource = Get.find<RoomDataSource>();
    _voteDataSource = Get.find<VoteDataSource>();

    final arguments = Get.arguments as Map<String, dynamic>;
    final int chatroomId = arguments['chatroom_id'] ?? -1;
    final String issueTitle = arguments['issue_title'] ?? '';
    _issueTitle.value = issueTitle;
    fetchRoomData(chatroomId);
  }

  Future<void> fetchRoomData(int chatroomId) async {
    try {
      final response = await _roomDataSource.getRoom(chatroomId: chatroomId);
      _roomData.value = response.data;
      voteStatus.value = response.data.opinion;
    } catch (e) {
      log.d('Error fetching room data: $e');
    }
  }

  Future<void> postVoteData(String opinion, int chatroomId) async {
    try {
      _voteDataSource.postVote(opinion: opinion, chatroomId: chatroomId);
      updateVoteStatus(opinion);
    } catch (e) {
      log.d('Error fetching room data: $e');
    }
  }
}
