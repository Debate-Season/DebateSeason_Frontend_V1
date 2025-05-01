class ReportReasonReq {
  final List<String> reasons;
  final String? etcDescription;

  ReportReasonReq({
    required this.reasons,
    this.etcDescription,
  });

  Map<String, dynamic> toJson() => {
        'reasonType': reasons,
        if (etcDescription != null) 'reasonDetail': etcDescription,
      };
}
