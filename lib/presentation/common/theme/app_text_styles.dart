import 'package:flutter/material.dart';

class AppTextStyles implements AppTextStylesData {
  const AppTextStyles.of(BuildContext context) : _context = context;

  final BuildContext _context;

  TextTheme get _textTheme => Theme.of(_context).textTheme;

  @override
  TextStyle? get animalsHeaderSubtitle =>
      _textTheme.subtitle1?.copyWith(fontSize: 24);

  @override
  TextStyle? get animalsHeaderTitle =>
      _textTheme.headline1?.copyWith(fontSize: 64);

  @override
  TextStyle? get animalFact => _textTheme.bodyText2?.copyWith(fontSize: 20);
}

abstract class AppTextStylesData {
  TextStyle? get animalsHeaderTitle;
  TextStyle? get animalsHeaderSubtitle;
  TextStyle? get animalFact;
}
