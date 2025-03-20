import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'terms_res.g.dart';

@JsonSerializable()
class TermsRes {
  int termsId;
  String termsType;
  String version;
  String notionUrl;

  TermsRes({
    required this.termsId,
    required this.termsType,
    required this.version,
    required this.notionUrl,
  });

  factory TermsRes.fromJson(Map<String, dynamic> json) =>
      _$TermsResFromJson(json);

  Map<String, dynamic> toJson() => _$TermsResToJson(this);

  TermsEntity toEntity(TermsRes res) => TermsEntity(
        termsId: res.termsId,
        termsType: res.termsType,
        version: res.version,
        notionUrl: res.notionUrl,
      );

  static List<TermsRes> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TermsRes.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
