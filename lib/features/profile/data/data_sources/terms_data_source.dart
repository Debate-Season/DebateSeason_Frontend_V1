import 'package:debateseason_frontend_v1/features/profile/data/models/response/terms_res.dart';
import 'package:debateseason_frontend_v1/utils/base/base_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'terms_data_source.g.dart';

@RestApi()
abstract class TermsDataSource {
  factory TermsDataSource(Dio dio) = _TermsDataSource;

  @GET('/api/v1/terms')
  Future<BaseRes<List<TermsRes>>> getTerms();
}