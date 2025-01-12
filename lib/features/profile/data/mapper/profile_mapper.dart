import 'package:debateseason_frontend_v1/features/profile/data/models/remote/request/profile_req.dart';
import 'package:debateseason_frontend_v1/features/profile/data/models/remote/response/profile_res.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/profile_entity.dart';

class ProfileMapper {
  static ProfileReq toReq({required ProfileEntity entity}) {
    return ProfileReq(
      nickname: entity.nickname,
      communityId: entity.communityId,
      gender: entity.gender,
      ageRange: entity.ageRange,
    );
  }

  static ProfileEntity toEntity({required ProfileRes res}) {
    return ProfileEntity(
      nickname: res.nickname,
      communityId: res.communityId,
      gender: res.gender,
      ageRange: res.ageRange,
    );
  }
}
