import 'package:debateseason_frontend_v1/features/notification/data/data_sources/fcm_token_data_source.dart';
import 'package:debateseason_frontend_v1/features/notification/data/models/request/fcm_token_req.dart';
import 'package:debateseason_frontend_v1/features/notification/domain/entities/fcm_token_entity.dart';
import 'package:debateseason_frontend_v1/features/notification/domain/repositories/fcm_token_repository.dart';
import 'package:debateseason_frontend_v1/utils/base/ui_state.dart';

class FcmTokenRepositoryImpl implements FcmTokenRepository {
  final FcmTokenDataSource dataSource;

  FcmTokenRepositoryImpl(this.dataSource);

  @override
  Future<UiState<void>> postFcmToken({
    required FcmTokenEntity entity,
  }) async {
    final httpResponse = await dataSource.postFcmToken(
      body: FcmTokenReq.fromEntity(entity),
    );

    final response = httpResponse.data;

    switch (response.status) {
      case 200 || 201:
        return UiState.success(null);
      default:
        if (response.message.isEmpty) {
          return UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }

  @override
  Future<UiState<void>> putFcmToken({
    required FcmTokenEntity entity,
  }) async {
    final httpResponse = await dataSource.putFcmToken(
      body: FcmTokenReq.fromEntity(entity),
    );

    final response = httpResponse.data;

    switch (response.status) {
      case 200 || 201:
        return UiState.success(null);
      default:
        if (response.message.isEmpty) {
          return UiState.failure('서버통신에 문제가 발생했습니다.');
        }

        return UiState.failure(response.message);
    }
  }
}
