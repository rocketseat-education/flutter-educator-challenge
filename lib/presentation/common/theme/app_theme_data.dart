import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_utils.dart';

class AppThemeData {
  const AppThemeData.of(BuildContext context) : _context = context;

  final BuildContext _context;

  static final _typography = Typography.material2018();
  static final _fontFamily = GoogleFonts.lobster().fontFamily;

  Typography get typography => Typography.material2018(
        black: _typography.black.apply(
          fontFamily: _fontFamily,
          displayColor: _context.colors.darkTextThemeDisplay,
          bodyColor: _context.colors.darkTextThemeBody,
        ),
      );
}
