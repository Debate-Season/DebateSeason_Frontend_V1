import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  factory ProfileEntity({
    required String nickname,
    required int communityId,
    required String gender,
    required String ageRange,
  }) = _ProfileEntity;
}
