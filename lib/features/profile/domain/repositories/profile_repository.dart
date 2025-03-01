import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class ProfileRepository {
  Future<UiState<ProfileEntity>> getProfile();

  Future<UiState<String>> postProfile({
    required ProfileEntity entity,
  });

  Future<UiState<String>> patchProfile({
    required ProfileEntity entity,
  });
}
