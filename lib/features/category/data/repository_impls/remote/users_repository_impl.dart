import 'package:debateseason_frontend_v1/features/category/data/data_sources/remote/users_data_source.dart';
import 'package:debateseason_frontend_v1/features/category/data/mapper/category_mapper.dart';
import 'package:debateseason_frontend_v1/features/category/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/features/category/domain/repositories/remote/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource dataSource;

  UsersRepositoryImpl(this.dataSource);

  @override
  Future<List<CategoryEntity>> getUsers() async {
    final response = await dataSource.getUsers();

    return response.data.map((res) => CategoryMapper().toEntity(res)).toList();
  }
}
