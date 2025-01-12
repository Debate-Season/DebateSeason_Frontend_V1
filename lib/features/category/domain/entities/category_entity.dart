import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  factory CategoryEntity({
    required int issueId,
    required String title,
    required String createdAt,
    required int countChatRoom,
  }) = _CategoryEntity;
}
