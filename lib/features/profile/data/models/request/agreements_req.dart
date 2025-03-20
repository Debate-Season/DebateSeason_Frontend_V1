import 'package:debateseason_frontend_v1/features/profile/domain/entities/terms_agree_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agreements_req.g.dart';

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
