import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_entity.freezed.dart';

@freezed
abstract class CommunityEntity with _$CommunityEntity {
  factory CommunityEntity({
    required int id,
    required String name,
    required String iconUrl,
  }) = _CommunityEntity;
}
