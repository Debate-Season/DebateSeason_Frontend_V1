import 'package:debateseason_frontend_v1/features/issue/data/datasources/remote/issue_data_source.dart';
import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/issue_res.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class IssueRoomViewModel extends GetxController {
  late final IssueDataSource _issueDataSource;
  final Rx<IssueRes?> _issueData = Rx<IssueRes?>(null);
  final _issueId = (-1).obs;

  IssueRes? get issueData => _issueData.value;

  int get issueId => _issueId.value;

  var issueTitle = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _issueDataSource = Get.find<IssueDataSource>();

    final arguments = Get.arguments as Map<String, int>;
    final int issueId = arguments['issue_id'] ?? -1;
    _issueId.value = issueId;
    fetchIssueData(issueId);
  }

  Future<void> fetchIssueData(int issueId) async {
    try {
      final response = await _issueDataSource.getIssue(issueId: issueId);
      _issueData.value = response.data;
      issueTitle.value = response.data.title;
    } catch (e) {
      log.d(e);
    }
  }
}
