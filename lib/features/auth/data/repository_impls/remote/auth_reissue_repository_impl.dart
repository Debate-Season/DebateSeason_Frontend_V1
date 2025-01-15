import 'package:debateseason_frontend_v1/core/services/secure_storage_service.dart';
import 'package:debateseason_frontend_v1/features/auth/data/data_sources/remote/auth_reissue_data_source.dart';
import 'package:debateseason_frontend_v1/features/auth/data/mapper/auth_reissue_mapper.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/auth_reissue_entity.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/repositories/remote/auth_reissue_repository.dart';

class AuthReissueRepositoryImpl implements AuthReissueRepository {
  final AuthReissueDataSource dataSource;

  AuthReissueRepositoryImpl(this.dataSource);

  @override
  Future<void> postAuthReissue({
    required AuthReissueEntity entity,
  }) async {
    final SecureStorageService storage = SecureStorageService();

    final response = await dataSource.postAuthReissue(
      body: AuthReissueMapper.toRequest(entity: entity),
    );

    final authReissue = AuthReissueMapper.toEntity(res: response.data);

    await Future.wait([
      storage.setAccessToken(accessToken: authReissue.accessToken),
      storage.setRefreshToken(refreshToken: authReissue.accessToken),
    ]);
  }
}
