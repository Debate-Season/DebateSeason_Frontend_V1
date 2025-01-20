import 'package:debateseason_frontend_v1/features/issue/data/datasources/remote/issue_data_source.dart';
import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/issue_res.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class IssueRoomViewModel extends GetxController {
  late final IssueDataSource _issueDataSource;
  final Rx<IssueRes?> _issueData = Rx<IssueRes?>(null);
  IssueRes? get issueData => _issueData.value;

  @override
  void onInit() {
    super.onInit();
    _issueDataSource = Get.find<IssueDataSource>();

    final int issueId = (Get.arguments) ?? 1;
    log.d('issueId : $issueId');
    fetchIssueData(issueId);
  }

  Future<void> fetchIssueData(int issueId) async {
    try {
      final response = await _issueDataSource.getIssue(issueId: issueId);
      _issueData.value = response.data;
      log.d(_issueData.value);
    } catch (e) {
      log.d(e);
    }
  }
}