import 'package:debateseason_frontend_v1/features/auth/data/models/remote/request/auth_reissue_req.dart';
import 'package:debateseason_frontend_v1/features/auth/data/models/remote/response/auth_reissue_res.dart';
import 'package:debateseason_frontend_v1/features/auth/domain/entities/auth_reissue_entity.dart';

class AuthReissueMapper {
  static AuthReissueReq toRequest({required AuthReissueEntity entity}) {
    return AuthReissueReq(refreshToken: entity.refreshToken);
  }

  static AuthReissueEntity toEntity({required AuthReissueRes res}) {
    return AuthReissueEntity(
      accessToken: res.accessToken,
      refreshToken: res.refreshToken,
    );
  }
}
