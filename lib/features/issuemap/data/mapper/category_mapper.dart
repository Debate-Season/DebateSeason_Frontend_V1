import 'package:debateseason_frontend_v1/features/issuemap/data/models/remote/response/users_home_res.dart';
import 'package:debateseason_frontend_v1/features/issuemap/domain/entities/category_entity.dart';

class CategoryMapper {
  CategoryEntity toEntity(UsersHomeRes res) {
    return CategoryEntity(
      issueId: res.issueId,
      title: res.title,
      createdAt: res.createdAt,
      countChatRoom: res.countChatRoom,
    );
  }
}
