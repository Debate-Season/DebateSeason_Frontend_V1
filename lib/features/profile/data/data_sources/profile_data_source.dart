import 'package:debateseason_frontend_v1/features/profile/data/models/request/profile_image_req.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/request/profile_req.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/response/profile_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_data_source.g.dart';

@RestApi()
abstract class ProfileDataSource {
  factory ProfileDataSource(Dio dio) = _ProfileDataSource;

  @POST('/api/v1/profiles')
  Future<NullableBaseRes> postProfiles({
    @Body() required ProfileReq body,
  });

  @PATCH('/api/v1/profiles')
  Future<NullableBaseRes> patchProfiles({
    @Body() required ProfileReq body,
  });

  @GET('/api/v1/profiles/me')
  Future<BaseRes<ProfileRes>> getProfilesMe();

  @PATCH('/api/v1/profiles/image')
  Future<NullableBaseRes> patchProfilesImage({
    @Body() required ProfileImageReq body,
  });
}
