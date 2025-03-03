import 'package:debateseason_frontend_v1/features/issue/domain/entities/issue_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class IssueRepository {
  Future<UiState<IssueEntity>> getIssue({required int issueId});
}
