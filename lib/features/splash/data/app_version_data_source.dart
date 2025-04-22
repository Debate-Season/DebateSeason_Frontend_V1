import 'package:debateseason_frontend_v1/features/splash/data/app_version_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_version_data_source.g.dart';

@RestApi()
abstract class AppVersionDataSource {
  factory AppVersionDataSource(Dio dio) = _AppVersionDataSource;

  @GET('/api/v1/app/version/check')
  @Extra({'access_token': false})
  Future<BaseRes<AppVersionRes>> getAppVersion({
    @Query('versionCode') required int versionCode,
  });
}
