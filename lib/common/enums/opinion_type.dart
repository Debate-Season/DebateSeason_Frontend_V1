enum OpinionType {
  agree('AGREE', '찬성'),
  disagree('DISAGREE', '반대'),
  neutral('NEUTRAL', '중립');

  final String value;
  final String valueKr;

  const OpinionType(this.value, this.valueKr);
}
