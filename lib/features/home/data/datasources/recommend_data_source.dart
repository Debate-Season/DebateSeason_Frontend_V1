import 'package:debateseason_frontend_v1/features/home/data/models/recommend_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';

part 'recommend_data_source.g.dart';

@RestApi()
abstract class RecommendDataSource {
  factory RecommendDataSource(Dio dio) = _RecommendDataSource;

  @GET('/api/v1/home/refresh')
  Future<BaseRes<RecommendRes>> getRecommend();

  // @GET('/api/v1/home/recommend')
  // Future<BaseRes<RecommendRes>> getRecommend();
}
