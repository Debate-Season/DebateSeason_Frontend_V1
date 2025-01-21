import 'package:debateseason_frontend_v1/features/profile/data/models/remote/request/users_logout_req.dart';
import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_logout_data_source.g.dart';

@RestApi()
abstract class UsersLogoutDataSource {
  factory UsersLogoutDataSource(Dio dio) = _UsersLogoutDataSource;

  @POST('/api/v1/users/logout')
  Future<NullableBaseRes> postUsersLogout({
    @Body() required UsersLogoutReq body,
  });
}
