import 'package:debateseason_frontend_v1/features/issuemap/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/features/issuemap/domain/repositories/users_home_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:get/get.dart';

class IssuemapViewModel extends GetxController {
  late final UsersHomeRepository _usersHomeRepository;
  final _categories =
      Rx<UiState<List<CategoryEntity>>>(const UiState.loading());

  UiState<List<CategoryEntity>> get categories => _categories.value;

  @override
  void onInit() async {
    super.onInit();

    _usersHomeRepository = Get.find<UsersHomeRepository>();
    await getCategories();
  }

  Future<void> getCategories() async {
    final result = await _usersHomeRepository.getUsers();
    _categories.value = result;
  }
}
