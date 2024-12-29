import 'package:debateseason_frontend_v1/features/category/presentation/view_models/category_view_model.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryViewModel());
  }
}
