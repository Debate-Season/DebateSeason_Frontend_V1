import 'package:debateseason_frontend_v1/features/chat/data/models/report_reason_req.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_reason_selection.freezed.dart';

@freezed
class ReportReasonSelection with _$ReportReasonSelection {
  const factory ReportReasonSelection({
    @Default(false) bool isAbusive, // 욕설
    @Default(false) bool isSexual, // 음란
    @Default(false) bool isFalseInfo, // 허위
    @Default(false) bool isSpam, // 도배
    @Default(false) bool isPromotion, // 홍보
    @Default(false) bool isPrivacyLeak, // 개인정보 노출
    @Default(false) bool isEtc, // 기타
    @Default("") String? etcDescription, // 기타 설명 (기타가 true일 경우 유효)
  }) = _ReportReasonSelection;
  const ReportReasonSelection._(); // for custom methods

  /// 변환 함수 (to DTO)
  ReportReasonReq toReq() {
    final reasons = <String>[];
    if (isAbusive) reasons.add("ABUSIVE");
    if (isSexual) reasons.add("SEXUAL");
    if (isFalseInfo) reasons.add("FALSE_INFO");
    if (isSpam) reasons.add("SPAM");
    if (isPromotion) reasons.add("PROMOTION");
    if (isPrivacyLeak) reasons.add("PRIVACY_LEAK");
    if (isEtc) reasons.add("ETC");

    return ReportReasonReq(
      reasons: reasons,
      etcDescription: isEtc ? etcDescription : null,
    );
  }
}

extension ReportReasonSelectionExtension on ReportReasonSelection {
  bool get hasAnySelected =>
      isAbusive ||
      isSexual ||
      isFalseInfo ||
      isSpam ||
      isPromotion ||
      isPrivacyLeak ||
      isEtc;
}
