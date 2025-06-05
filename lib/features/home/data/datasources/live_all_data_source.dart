import 'package:debateseason_frontend_v1/features/home/data/models/live_all_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';

part 'live_all_data_source.g.dart';

@RestApi()
abstract class LiveAllDataSource {
  factory LiveAllDataSource(Dio dio) = _LiveAllDataSource;

  @GET('/api/v1/lives')
  Future<BaseRes<LiveAllRes>> getLiveAll();
}
