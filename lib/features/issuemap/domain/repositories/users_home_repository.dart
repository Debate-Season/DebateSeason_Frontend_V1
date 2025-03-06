import 'package:debateseason_frontend_v1/features/issuemap/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class UsersHomeRepository {
  Future<UiState<List<CategoryEntity>>> getUsers();
}
