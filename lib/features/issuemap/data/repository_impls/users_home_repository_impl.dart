import 'package:debateseason_frontend_v1/features/issuemap/data/data_sources/users_home_data_source.dart';
import 'package:debateseason_frontend_v1/features/issuemap/data/mapper/category_mapper.dart';
import 'package:debateseason_frontend_v1/features/issuemap/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/features/issuemap/domain/repositories/users_home_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';

class UsersHomeRepositoryImpl implements UsersHomeRepository {
  final UsersHomeDataSource dataSource;

  UsersHomeRepositoryImpl(this.dataSource);

  @override
  Future<UiState<List<CategoryEntity>>> getUsers() async {
    final response = await dataSource.getUsers();

    switch (response.status) {
      case 200:
        return UiState.success(
          response.data.map((res) => CategoryMapper().toEntity(res)).toList(),
        );
      default:
        if (response.message.isEmpty) {
          UiState.failure('데이터를 불러오는데 에러가 발생했습니다.');
        }

        log.d(response.message);
        return UiState.failure(response.message);
    }
  }
}
