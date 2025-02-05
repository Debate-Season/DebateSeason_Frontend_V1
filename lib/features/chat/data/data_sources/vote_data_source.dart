import 'package:debateseason_frontend_v1/features/chat/presentation/types/opinion_type.dart';
import 'package:debateseason_frontend_v1/utils/base/nullable_base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'vote_data_source.g.dart';

@RestApi()
abstract class VoteDataSource {
  factory VoteDataSource(Dio dio) = _VoteDataSource;

  @POST('/api/v1/room/vote')
  Future<NullableBaseRes> postVote({
    @Query('opinion') required String opinion,
    @Query('chatroom-id') required int chatroomId,
  });
}
