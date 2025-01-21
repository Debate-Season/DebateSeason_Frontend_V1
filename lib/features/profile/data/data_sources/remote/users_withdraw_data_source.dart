import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_withdraw_data_source.g.dart';

@RestApi()
abstract class UsersWithdrawDataSource {
  factory UsersWithdrawDataSource(Dio dio) = _UsersWithdrawDataSource;

  @POST('/api/v1/users/withdraw')
  Future<NullableBaseRes> postUsersWithdraw();
}
