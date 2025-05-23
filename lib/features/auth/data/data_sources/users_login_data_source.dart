import 'package:debateseason_frontend_v1/features/auth/data/models/request/users_login_req.dart';
import 'package:debateseason_frontend_v1/features/auth/data/models/response/users_login_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_login_data_source.g.dart';

@RestApi()
abstract class UsersLoginDataSource {
  factory UsersLoginDataSource(Dio dio) = _UsersLoginDataSource;

  @POST("/api/v2/users/login")
  @Extra({'access_token': false})
  Future<BaseRes<UsersLoginRes>> postUsersLogin({
    @Body() required UsersLoginReq requestBody,
  });
}
