import 'package:debateseason_frontend_v1/features/category/data/models/remote/response/users_home_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_home_data_source.g.dart';

@RestApi()
abstract class UsersHomeDataSource {
  factory UsersHomeDataSource(Dio dio) = _UsersHomeDataSource;

  @GET("/api/v1/users/home")
  Future<BaseRes<List<UsersHomeRes>>> getUsers();
}
