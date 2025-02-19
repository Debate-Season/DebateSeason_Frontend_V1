import 'package:debateseason_frontend_v1/features/chat/data/data_sources/room_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/data_sources/vote_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/response/room_res.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/types/opinion_type.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_models/issue_room_view_model.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class DebateRoomViewModel extends GetxController {
  late RoomDataSource _roomDataSource;
  late VoteDataSource _voteDataSource;
  final Rx<RoomRes?> _roomData = Rx<RoomRes?>(null);
  var voteStatus = OpinionType.neutral.value.obs;
  final _issueTitle = ''.obs;
  final _chatRoomId = (-1).obs;

  RoomRes? get roomData => _roomData.value;

  String get issueTitle => _issueTitle.value;

  int get chatRoomId => _chatRoomId.value;

  @override
  void onInit() {
    super.onInit();
    _roomDataSource = Get.find<RoomDataSource>();
    _voteDataSource = Get.find<VoteDataSource>();

    final arguments = Get.arguments as Map<String, dynamic>;
    final int chatroomId = arguments['chatroom_id'] ?? -1;
    final String issueTitle = arguments['issue_title'] ?? '';
    _issueTitle.value = issueTitle;
    _chatRoomId.value = chatroomId;
    fetchRoomData(chatroomId);
  }

  Future<void> fetchRoomData(int chatroomId) async {
    try {
      final response = await _roomDataSource.getRoom(chatroomId: chatroomId);
      _roomData.value = response.data;
      // var tempVoteStatus = response.data.opinion;
      // if(tempVoteStatus == '찬성'){
      //   voteStatus.value = OpinionType.agree;
      // } else if(tempVoteStatus == '반대'){
      //   voteStatus.value = OpinionType.disagree;
      // } else {
      //   voteStatus.value = OpinionType.neutral;
      // }

      // if(response.data.opinion == 'none'){
      //   voteStatus.value = OpinionType.neutral;
      // }
      // else{
      //   voteStatus.value = response.data.opinion;
      // }
      try {
        voteStatus.value = response.data.opinion;
      } catch (e) {
        voteStatus.value = OpinionType.neutral.value;
      }
    } catch (e) {
      log.d('Error fetching room data: $e');
    }
  }

  Future<void> postVoteData(OpinionType opinion, int chatroomId) async {
    try {
      await _voteDataSource.postVote(
        opinion: opinion.value,
        chatroomId: chatroomId,
      );
      updateVoteStatus(opinion);
      _updateRoom(opinion: opinion);
      final issueRoomViewModel = Get.find<IssueRoomViewModel>();
      await issueRoomViewModel.fetchIssueData(issueRoomViewModel.issueId);
      await fetchRoomData(_chatRoomId.value);
    } catch (e, s) {
      log.d('postVoteData: $e\n'
          '$s');
    }
  }

  void updateVoteStatus(OpinionType newOpinion) {
    voteStatus.value = newOpinion.value;
  }

  void _updateRoom({required OpinionType opinion}) {
    _roomData.value = roomData?.copyWith(opinion: opinion.value);
  }
}
