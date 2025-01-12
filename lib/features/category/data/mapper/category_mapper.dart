import 'package:debateseason_frontend_v1/features/category/data/models/remote/response/users_res.dart';
import 'package:debateseason_frontend_v1/features/category/domain/entities/category_entity.dart';

class CategoryMapper {
  CategoryEntity toEntity(UsersRes res) {
    return CategoryEntity(
      issueId: res.issueId,
      title: res.title,
      createdAt: res.createdAt,
      countChatRoom: res.countChatRoom,
    );
  }
}
