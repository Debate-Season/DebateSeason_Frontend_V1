import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/terms_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class TermsViewModel extends GetxController {
  late final TermsRepository _termsRepository;
  final _termsData = Rx<UiState<List<TermsEntity>>>(const UiState.loading());

  UiState<List<TermsEntity>> get termsData => _termsData.value;

  @override
  void onInit() async {
    super.onInit();
    _termsRepository = Get.find<TermsRepository>();
    await getTerms();
  }

  Future<void> getTerms() async {
    try {
      final response = await _termsRepository.getTerms();
      _termsData.value = response;
    } catch (e) {
      log.d(e);
    }
  }
}
