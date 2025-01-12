import 'package:debateseason_frontend_v1/features/profile/data/models/remote/response/community_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'community_data_source.g.dart';

@RestApi()
abstract class CommunityDataSource {
  factory CommunityDataSource(Dio dio) = _CommunityDataSource;

  @GET('/api/v1/communities')
  Future<BaseRes<List<CommunityRes>>> getCommunities();
}
