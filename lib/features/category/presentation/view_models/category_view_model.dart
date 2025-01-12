import 'package:debateseason_frontend_v1/features/category/domain/entities/category_entity.dart';
import 'package:debateseason_frontend_v1/features/category/domain/repositories/remote/users_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  late final UsersRepository _usersRepository;
  final _categories =
      Rx<UiState<List<CategoryEntity>>>(const UiState.loading());

  UiState<List<CategoryEntity>> get categories => _categories.value;

  @override
  void onInit() async {
    super.onInit();

    _usersRepository = Get.find<UsersRepository>();
    await getCategories();
  }

  Future<void> getCategories() async {
    _categories.value = const UiState.loading();

    try {
      final result = await _usersRepository.getUsers();

      _categories.value = UiState.success(result);
    } catch (e) {
      log.d(e);
      _categories.value = UiState.failure('데이터를 불러오는데 에러가 발생했습니다.');
    }
  }
}
