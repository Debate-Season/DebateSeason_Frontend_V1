import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/auth_reissue_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/models/request/auth_reissue_req.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/auth_reissue_repository.dart';

class AuthReissueRepositoryImpl implements AuthReissueRepository {
  final AuthReissueDataSource dataSource;

  AuthReissueRepositoryImpl(this.dataSource);

  @override
  Future<int> postAuthReissue({
    required String refreshToken,
  }) async {
    final SecureStorageService storage = SecureStorageService();

    final response = await dataSource.postAuthReissue(
      body: AuthReissueReq(refreshToken: refreshToken),
    );

    await Future.wait([
      storage.setAccessToken(accessToken: response.data.accessToken),
      storage.setRefreshToken(refreshToken: response.data.refreshToken),
    ]);

    return response.status;
  }
}
