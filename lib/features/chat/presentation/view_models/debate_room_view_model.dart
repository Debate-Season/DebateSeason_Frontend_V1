import 'package:debateseason_frontend_v1/common/enums/opinion_type.dart';
import 'package:debateseason_frontend_v1/features/chat/data/data_sources/room_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/data_sources/vote_data_source.dart';
import 'package:debateseason_frontend_v1/features/chat/data/models/room_res.dart';
import 'package:debateseason_frontend_v1/features/chat/presentation/views/debate_topic_screen.dart';
import 'package:debateseason_frontend_v1/features/issue/presentation/view_models/issue_room_view_model.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class DebateRoomViewModel extends GetxController {
  late RoomDataSource _roomDataSource;
  late VoteDataSource _voteDataSource;

  final _roomData = Rx<RoomRes>(
    RoomRes(
      chatRoomId: -1,
      title: '',
      content: '',
      opinion: OpinionType.neutral,
      agree: 0,
      disagree: 0,
      createdAt: DateTime.now(),
    ),
  );
  final _voteStatus = OpinionType.neutral.obs;
  final _issueTitle = ''.obs;
  final _chatRoomId = (-1).obs;

  RoomRes get roomData => _roomData.value;

  OpinionType get voteStatus => _voteStatus.value;

  String get issueTitle => _issueTitle.value;

  int get chatRoomId => _chatRoomId.value;

  final tabselected = 0.obs;

  @override
  void onInit() {
    super.onInit();
    AmplitudeUtil.trackEvent(eventName: 'DebateRoom');
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
      _voteStatus.value = response.data.opinion;
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
      await Future.wait([
        issueRoomViewModel.fetchIssueData(issueRoomViewModel.issueId),
        fetchRoomData(_chatRoomId.value),
      ]);
    } catch (e, s) {
      log.d('postVoteData: $e\n'
          '$s');
    }
  }

  void updateVoteStatus(OpinionType newOpinion) {
    _voteStatus.value = newOpinion;
  }

  void _updateRoom({required OpinionType opinion}) {
    _roomData.value = roomData.copyWith(opinion: opinion);
  }

  void onTapDebateTopic() {
    Get.to(DebateTopicScreen());
  }

  void onTapTab(int index) {
    tabselected.value = index;
  }
}
