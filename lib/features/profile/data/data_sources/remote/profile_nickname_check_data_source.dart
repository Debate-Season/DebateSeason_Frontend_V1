import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_nickname_check_data_source.g.dart';

@RestApi()
abstract class ProfileNicknameCheckDataSource {
  factory ProfileNicknameCheckDataSource(Dio dio) =
      _ProfileNicknameCheckDataSource;

  @GET('/api/v1/profiles/nickname/check')
  Future<NullableBaseRes> getProfilesNicknameCheck({
    @Query('query') required String nickname,
  });
}
