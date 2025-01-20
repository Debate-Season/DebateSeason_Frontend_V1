import 'package:debateseason_frontend_v1/features/issue/data/models/remote/response/issue_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'issue_data_source.g.dart';

@RestApi()
abstract class IssueDataSource {
  factory IssueDataSource(Dio dio) = _IssueDataSource;

  @GET('/api/v1/issue')
  Future<BaseRes<IssueRes>> getIssue({
    @Query('issue-id') required int issueId,
});
}