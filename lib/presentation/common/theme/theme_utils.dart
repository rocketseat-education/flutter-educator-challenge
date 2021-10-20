import 'package:flutter/widgets.dart';

import 'app_text_styles.dart';
import 'app_colors.dart';

extension AppColorsUtil on BuildContext {
  static final _colors = AppColors();

  AppColorsData get colors => _colors;
}

extension AppTextStylesUtil on BuildContext {
  AppTextStylesData get textStyles => AppTextStyles.of(this);
}
