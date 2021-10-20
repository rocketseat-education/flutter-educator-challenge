import 'dart:ui';

class AppColors implements AppColorsData {
  static const _white = Color(0XFFFFFFFF);
  static const _whiteSmoke = Color(0XFFF5F5F5);
  static const _orange = Color(0xFFFFAF7A);
  static const _blueGrey = Color(0xFF455A64);
  static const _blueGrey2 = Color(0xFF546E7A);

  @override
  List<Color> get backgroundGradientColorList => <Color>[
        _whiteSmoke,
        _orange.withOpacity(0.25),
      ];

  @override
  Color get darkTextThemeDisplay => _blueGrey;

  @override
  Color get darkTextThemeBody => _blueGrey2;

  @override
  Color get lightTextThemeBody => _whiteSmoke;

  @override
  Color get lightTextThemeDisplay => _whiteSmoke;

  @override
  Color get animalsImageViewerArrow => _orange;

  @override
  Color get animalsImageViewerImageBorder => _orange;
}

abstract class AppColorsData {
  List<Color> get backgroundGradientColorList;
  Color get darkTextThemeDisplay;
  Color get darkTextThemeBody;
  Color get lightTextThemeDisplay;
  Color get lightTextThemeBody;
  Color get animalsImageViewerArrow;
  Color get animalsImageViewerImageBorder;
}
