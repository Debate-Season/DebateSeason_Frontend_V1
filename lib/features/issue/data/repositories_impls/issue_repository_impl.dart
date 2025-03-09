import 'package:debateseason_frontend_v1/features/issue/data/datasources/issue_data_source.dart';
import 'package:debateseason_frontend_v1/features/issue/domain/entities/issue_entity.dart';
import 'package:debateseason_frontend_v1/features/issue/domain/repositories/issue_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class IssueRepositoryImpl implements IssueRepository {
  final IssueDataSource dataSource;

  IssueRepositoryImpl(this.dataSource);

  @override
  Future<UiState<IssueEntity>> getIssue({required int issueId}) async {
    final response = await dataSource.getIssue(issueId: issueId);
    switch (response.status) {
      case 200:
        return UiState.success(response.data.toEntity());
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오는데 에러가 발생했습니다.');
        }
    }
    return UiState.failure(response.message);
  }
}
