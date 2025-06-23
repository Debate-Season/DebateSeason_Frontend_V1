import 'package:debateseason_frontend_v1/features/home/data/models/media_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';

part 'media_data_source.g.dart';

@RestApi()
abstract class MediaDataSource {
  factory MediaDataSource(Dio dio) = _MediaDataSource;

  @GET('/api/v1/home/media')
  Future<BaseRes<MediaRes>> getMedia({
    @Query('type') String? type,
    @Query('time') String? time,
  });
}
