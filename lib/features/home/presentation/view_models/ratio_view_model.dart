getPercentages(int agree, int disagree) {
  int total = agree + disagree;
  double agreeRatio = agree / total;
  double disagreeRatio = disagree / total;

  if (total == 0) {
    agreeRatio = 0;
    disagreeRatio = 0;
  }
  String agreeRatioText = (agreeRatio * 100).toStringAsFixed(0);
  String disagreeRatioText = (disagreeRatio * 100).toStringAsFixed(0);

  return [agreeRatioText, disagreeRatioText];
}