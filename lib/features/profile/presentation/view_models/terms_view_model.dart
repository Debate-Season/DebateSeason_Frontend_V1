import 'package:debateseason_frontend_v1/core/routers/get_router_name.dart';
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

  List<TermsAgreeEntity> get agreeData => _agreeData;

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

  Future<void> postTermsAgree() async {
    try {
      final response =
          await _termsRepository.postTermsAgree(entities: _agreeData.toList());

      response.when(
        loading: () {
          Get.snackbar('약관 로딩중', '잠시 후 다시 시도해주세요.');
        },
        success: (_) {
          Get.toNamed(GetRouterName.profileInput);
        },
        failure: (_) {
          Get.snackbar('약관 동의 실패', '잠시 후 다시 시도해주세요.');
        },
      );
    } catch (e) {
      log.d(e);
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
