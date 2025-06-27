import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class ProfileRepository {
  Future<UiState<ProfileEntity>> getProfile();

  Future<UiState<void>> postProfile({
    required ProfileEntity entity,
  });

  Future<UiState<void>> patchProfile({
    required ProfileEntity entity,
  });

  Future<UiState<void>> postProfileImage({
    required String profileImage,
  });
}
