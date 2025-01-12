import 'package:debateseason_frontend_v1/features/category/data/models/remote/response/users_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_data_source.g.dart';

@RestApi()
abstract class UsersDataSource {
  factory UsersDataSource(Dio dio) = _UsersDataSource;

  @GET("/api/v1/users")
  Future<BaseRes<List<UsersRes>>> getUsers();
}
