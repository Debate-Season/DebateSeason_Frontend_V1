import 'package:debateseason_frontend_v1/features/notification/data/models/request/fcm_token_req.dart';
import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'fcm_token_data_source.g.dart';

@RestApi()
abstract class FcmTokenDataSource {
  factory FcmTokenDataSource(Dio dio) = _FcmTokenDataSource;

  @POST('/api/v1/fcm/token')
  Future<HttpResponse<NullableBaseRes>> postFcmToken({
    @Body() required FcmTokenReq body,
  });

  @PUT('/api/v1/fcm/token')
  Future<HttpResponse<NullableBaseRes>> putFcmToken({
    @Body() required FcmTokenReq body,
  });
}
