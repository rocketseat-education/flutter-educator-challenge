import 'package:flutter/material.dart';
import 'package:rocketseat_educator_ps/presentation/home/home_screen.dart';
import 'presentation/common/theme/app_theme_data.dart';

void main() {
  runApp(
    const AnimalsApp(),
  );
}

class AnimalsApp extends StatelessWidget {
  const AnimalsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        typography: AppThemeData.of(context).typography,
      ),
      home: const HomeScreen(),
    );
  }
}
