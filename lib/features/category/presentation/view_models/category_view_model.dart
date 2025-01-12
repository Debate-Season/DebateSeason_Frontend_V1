import 'package:debateseason_frontend_v1/features/category/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/features/category/domain/repositories/remote/users_repository.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  late final UsersRepository _usersRepository;
  final _issues = <CategoryEntity>[].obs;

  List<CategoryEntity> get issues => _issues;

  @override
  void onInit() async {
    super.onInit();

    _usersRepository = Get.find<UsersRepository>();
    await getIssues();
  }

  Future<void> getIssues() async {
    final result = await _usersRepository.getUsers();

    _issues.value = result;
  }
}
