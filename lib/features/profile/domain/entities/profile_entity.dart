import 'package:debateseason_frontend_v1/features/profile/domain/entities/community_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  factory ProfileEntity({
    @Default('') String profileImage,
    required String nickname,
    required String gender,
    required String ageRange,
    required CommunityEntity community,
    String? residenceProvince,
    String? residenceDistrict,
    required String hometownProvince,
    required String hometownDistrict,
  }) = _ProfileEntity;
}
