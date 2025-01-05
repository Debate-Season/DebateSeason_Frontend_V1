import 'package:debateseason_frontend_v1/features/auth/data/models/remote/request/users_login_req.dart';
import 'package:debateseason_frontend_v1/features/auth/data/models/remote/response/users_login_res.dart';
import 'package:debateseason_frontend_v1/utils/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_login_data_source.g.dart';

@RestApi()
abstract class UsersLoginDataSource {
  factory UsersLoginDataSource(Dio dio) = _UsersLoginDataSource;

  @POST("/api/v1/users/login")
  @Extra({'access_token': 'true'})
  Future<BaseRes<UsersLoginRes>> postUsersLogin({
    @Body() required UsersLoginReq requestBody,
  });
}
