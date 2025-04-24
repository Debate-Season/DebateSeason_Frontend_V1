import 'dart:ui';

import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';

enum ImageType {
  red('빨강', DeColors.imageRed),
  orange('주황', DeColors.imageOrange),
  yellow('노랑', DeColors.imageYellow),
  green('초록', DeColors.imageGreen),
  blue('파랑', DeColors.imageBlue),
  navy('네이비', DeColors.imageNavy),
  purple('보라', DeColors.imagePurple);

  final String name;
  final Color color;

  const ImageType(this.name, this.color);
}
