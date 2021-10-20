import 'package:flutter/widgets.dart';

import 'theme/theme_utils.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [.75, 1],
          colors: context.colors.backgroundGradientColorList,
        ),
      ),
    );
  }
}
