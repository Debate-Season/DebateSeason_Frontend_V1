import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'app_versions_response.dart';

part 'app_versions_data_source.g.dart';

@RestApi()
abstract class AppVersionsDataSource {
  factory AppVersionsDataSource(Dio dio) = _AppVersionsDataSource;

  @GET('/api/v1/app/versions/check')
  Future<BaseRes<AppVersionsResponse>> getAppVersions({
    @Query('versionCode') required int versionCode,
  });
}
