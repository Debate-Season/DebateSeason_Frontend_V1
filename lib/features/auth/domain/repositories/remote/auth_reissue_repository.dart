import 'package:debateseason_frontend_v1/features/auth/domain/entities/auth_reissue_entity.dart';

abstract class AuthReissueRepository {
  Future<AuthReissueEntity> postAuthReissue({
    required AuthReissueEntity entity,
  });
}
