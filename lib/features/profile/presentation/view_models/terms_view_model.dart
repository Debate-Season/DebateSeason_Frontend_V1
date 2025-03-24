import 'package:debateseason_frontend_v1/common/constants/error_constants.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_agree_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/terms_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:debateseason_frontend_v1/utils/logger.dart';
import 'package:get/get.dart';

class TermsViewModel extends GetxController {
  late final TermsRepository _termsRepository;
  final _termsData = Rx<UiState<List<TermsEntity>>>(const UiState.loading());
  final _agreeData = RxList<TermsAgreeEntity>();
  final _profileStatus = false.obs;

  List<TermsAgreeEntity> get agreeData => _agreeData;

  UiState<List<TermsEntity>> get termsData => _termsData.value;

  bool get profileStatus => _profileStatus.value;

  @override
  void onInit() async {
    super.onInit();

    _profileStatus.value = Get.arguments as bool;
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

  Future<UiState<void>> postTermsAgree() async {
    try {
      return await _termsRepository.postTermsAgree(
        entities: _agreeData.toList(),
      );
    } catch (e, s) {
      log.d('$e\n$s');
      return UiState.failure(ErrorConstants.SERVER_ERROR);
    }
  }

  void checkAgree(int termsId, bool isChecked) {
    final index =
        _agreeData.indexWhere((element) => element.termsId == termsId);
    if (index != -1) {
      _agreeData[index] = _agreeData[index].copyWith(agreed: isChecked);
    } else {
      _agreeData.add(TermsAgreeEntity(termsId: termsId, agreed: isChecked));
    }
    //log.d('checkbox debug 로그: ${_agreeData.map((e) => '${e.termsId}:${e.agreed}').toList()}');
  }
}
