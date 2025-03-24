import 'package:debateseason_frontend_v1/features/profile/data/data_sources/terms_data_source.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/request/terms_agree_req.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_agree_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/terms_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class TermsRepositoryImpl implements TermsRepository {
  final TermsDataSource dataSource;

  TermsRepositoryImpl(this.dataSource);

  @override
  Future<UiState<List<TermsEntity>>> getTerms() async {
    final response = await dataSource.getTerms();

    switch (response.status) {
      case 200:
        return UiState.success(
            response.data.map((e) => e.toEntity(e)).toList());
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터 불러오기 실패');
        }
    }
    return UiState.failure(response.message);
  }

  @override
  Future<UiState<void>> postTermsAgree({
    required List<TermsAgreeEntity> entities,
  }) async {
    final reqBody = TermsAgreeReq.fromEntityList(entities);
    //log.d("📌 [postTermsAgree] 서버로 보낼 최종 JSON 데이터: $reqBody");

    final response = await dataSource.postTermsAgree(
      body: reqBody,
    );

    switch (response.status) {
      case 200:
        return UiState.success(null);
      default:
        if (response.message.isEmpty) {
          UiState.failure('서버통신에 문제가 발생했습니다.');
        }
        return UiState.failure(response.message);
    }
  }
}
