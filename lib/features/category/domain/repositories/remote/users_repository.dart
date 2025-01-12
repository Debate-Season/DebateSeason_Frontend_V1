import 'package:debateseason_frontend_v1/features/category/domain/entities/category_entity.dart';

abstract class UsersRepository {
  Future<List<CategoryEntity>> getUsers();
}
