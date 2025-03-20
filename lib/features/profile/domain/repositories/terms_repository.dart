import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class TermsRepository {
  Future<UiState<List<TermsEntity>>> getTerms();
}
