import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  factory ProfileEntity({
    required String nickname,
    required String gender,
    required String ageRange,
    required List<CommunityEntity> communities,
  }) = _ProfileEntity;
}
