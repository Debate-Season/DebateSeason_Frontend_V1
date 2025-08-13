import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_my_agree_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'terms_my_agree_res.g.dart';

@JsonSerializable()
class TermsMyAgreeRes {
  String termsType;
  String agreedAt;
  String notionUrl;

  TermsMyAgreeRes({
    required this.termsType,
    required this.agreedAt,
    required this.notionUrl,
  });

  factory TermsMyAgreeRes.fromJson(Map<String, dynamic> json) =>
      _$TermsMyAgreeResFromJson(json);

  Map<String, dynamic> toJson() => _$TermsMyAgreeResToJson(this);

  TermsMyAgreeEntity toEntity(TermsMyAgreeRes res) => TermsMyAgreeEntity(
        termsType: res.termsType,
        agreedAt: res.agreedAt,
        notionUrl: res.notionUrl,
      );

  static List<TermsMyAgreeRes> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TermsMyAgreeRes.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
