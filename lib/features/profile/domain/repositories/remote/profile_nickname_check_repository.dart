import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class ProfileNicknameCheckRepository {
  Future<UiState<String>> getProfileNicknameCheck({required String nickname});
}
