import 'package:flutter/widgets.dart';

import 'assets_path_builder.dart';

class AnimalsBottomNavigationBar extends StatelessWidget {
  const AnimalsBottomNavigationBar({
    required this.onTap,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 150,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _AnimalsBottomNavigationBarItem(
              index: 0,
              onTap: onTap,
              selectedIndex: selectedIndex,
              icon: Image.asset(AssetsPathBuilder.bottomNavigationCat),
            ),
            _AnimalsBottomNavigationBarItem(
              index: 1,
              onTap: onTap,
              selectedIndex: selectedIndex,
              icon: Image.asset(AssetsPathBuilder.bottomNavigationDog),
            ),
          ],
        ),
      );
}

class _AnimalsBottomNavigationBarItem extends StatelessWidget {
  const _AnimalsBottomNavigationBarItem({
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int index;
  final int selectedIndex;
  final void Function(int) onTap;
  final Widget icon;

  static const _duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedOpacity(
        duration: _duration,
        opacity: index == selectedIndex ? 1 : 0.5,
        child: AnimatedScale(
          scale: index == selectedIndex ? 1 : 0.75,
          duration: _duration,
          child: icon,
        ),
      ),
    );
  }
}
