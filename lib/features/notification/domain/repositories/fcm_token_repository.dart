import 'package:debateseason_frontend_v1/features/notification/domain/entities/fcm_token_entity.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

abstract class FcmTokenRepository {
  Future<UiState<void>> postFcmToken({
    required FcmTokenEntity entity,
  });

  Future<UiState<void>> putFcmToken({
    required FcmTokenEntity entity,
  });
}
