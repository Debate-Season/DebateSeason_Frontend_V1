import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/repositories/remote/profile_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  late final ProfileRepository _profileRepository;
  final _profile = Rx<UiState<ProfileEntity>>(const UiState.loading());

  UiState<ProfileEntity> get profile => _profile.value;

  @override
  void onInit() async {
    super.onInit();

    _profileRepository = Get.find<ProfileRepository>();
    await getProfile();
  }

  Future<void> getProfile() async {
    final result = await _profileRepository.getProfile();
    _profile.value = result;
  }
}
