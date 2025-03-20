import 'package:debateseason_frontend_v1/features/profile/data/data_sources/terms_data_source.dart';
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
}
