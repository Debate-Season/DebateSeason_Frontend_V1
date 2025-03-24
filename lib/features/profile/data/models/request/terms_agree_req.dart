import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_agree_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'terms_agree_req.g.dart';

@JsonSerializable()
class TermsAgreeReq {
  final List<AgreementsReq> agreements;

  TermsAgreeReq({
    required this.agreements,
  });

  factory TermsAgreeReq.fromJson(Map<String, dynamic> json) =>
      _$TermsAgreeReqFromJson(json);

  Map<String, dynamic> toJson() => _$TermsAgreeReqToJson(this);

  factory TermsAgreeReq.fromEntityList(List<TermsAgreeEntity> entities) {
    return TermsAgreeReq(
      agreements: entities
          .map((e) => AgreementsReq(termsId: e.termsId, agreed: e.agreed))
          .toList(),
    );
  }
}

@JsonSerializable()
class AgreementsReq {
  final int termsId;
  final bool agreed;

  AgreementsReq({
    required this.termsId,
    required this.agreed,
  });

  @override
  String toString() {
    return '{termsId: $termsId, agreed: $agreed}';
  }

  factory AgreementsReq.fromJson(Map<String, dynamic> json) =>
      _$AgreementsReqFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementsReqToJson(this);

  factory AgreementsReq.fromEntity(TermsAgreeEntity entity) {
    return AgreementsReq(
      termsId: entity.termsId,
      agreed: entity.agreed,
    );
  }
}
