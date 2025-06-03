import 'package:debateseason_frontend_v1/features/issue/domain/entities/issue_entity.dart';
import 'package:debateseason_frontend_v1/features/issue/domain/repositories/issue_repository.dart';
import 'package:debateseason_frontend_v1/utils/amplitude_util.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class IssueRoomViewModel extends GetxController {
  late final IssueRepository _issueRepository;
  final _issueData = Rx<UiState<IssueEntity>>(const UiState.loading());

  final _issueId = (-1).obs;

  UiState<IssueEntity> get issueData => _issueData.value;

  int get issueId => _issueId.value;

  @override
  void onInit() {
    super.onInit();
    AmplitudeUtil.trackEvent(eventName: 'IssueRoom');
    _issueRepository = Get.find<IssueRepository>();

    final arguments = Get.arguments as Map<String, int>;
    final int issueId = arguments['issue_id'] ?? -1;
    _issueId.value = issueId;
    fetchIssueData(issueId);
  }

  Future<void> fetchIssueData(int issueId) async {
    try {
      final response = await _issueRepository.getIssue(issueId: issueId);
      _issueData.value = response;
    } catch (e) {
      log.d(e);
    }
  }
}
