import 'package:debateseason_frontend_v1/features/auth/data/models/remote/request/auth_reissue_req.dart';
import 'package:debateseason_frontend_v1/features/auth/data/models/remote/response/auth_reissue_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_reissue_data_source.g.dart';

@RestApi()
abstract class AuthReissueDataSource {
  factory AuthReissueDataSource(Dio dio) = _AuthReissueDataSource;

  @POST('/api/v1/auth/reissue')
  @Extra({'access_token': false})
  Future<BaseRes<AuthReissueRes>> postAuthReissue({
    @Body() required AuthReissueReq body,
  });
}
