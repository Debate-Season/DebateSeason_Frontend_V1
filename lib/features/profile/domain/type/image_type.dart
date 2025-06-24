import 'dart:ui';

import 'package:debateseason_frontend_v1/core/constants/de_colors.dart';

enum ImageType {
  red('빨강', 'RED', DeColors.imageRed),
  orange('주황', 'ORANGE', DeColors.imageOrange),
  yellow('노랑', 'YELLOW', DeColors.imageYellow),
  green('초록', 'GREEN', DeColors.imageGreen),
  blue('파랑', 'BLUE', DeColors.imageBlue),
  navy('네이비', 'NAVY', DeColors.imageNavy),
  purple('보라', 'PURPLE', DeColors.imagePurple);

  final String name;
  final String engName;
  final Color color;

  const ImageType(this.name, this.engName, this.color);
}
