import 'package:debateseason_frontend_v1/features/profile/data/models/response/community_res.dart';
import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';

class CommunityMapper {
  static CommunityEntity toEntity({required CommunityRes res}) {
    return CommunityEntity(
      id: res.id,
      name: res.name,
      iconUrl: res.iconUrl,
    );
  }
}
