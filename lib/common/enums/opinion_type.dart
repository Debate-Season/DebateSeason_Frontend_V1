enum OpinionType {
  agree('AGREE', '찬성'),
  disagree('DISAGREE', '반대'),
  neutral('NEUTRAL', '중립');

  final String value;
  final String valueKr;

  const OpinionType(this.value, this.valueKr);

  static OpinionType fromJson(String json) {
    return OpinionType.values.firstWhere(
      (e) => e.value == json,
      orElse: () => throw ArgumentError('Unknown OpinionType: $json'),
    );
  }

  static String toJsonUpper(OpinionType opinion) {
    return opinion.value.toUpperCase();
  }
}
