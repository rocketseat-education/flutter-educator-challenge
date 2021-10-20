import 'package:flutter/material.dart';
import 'package:rocketseat_educator_ps/data/remote/model/animal.dart';

import 'theme/theme_utils.dart';

class AnimalsHeader extends StatelessWidget {
  const AnimalsHeader({
    required this.selectedAnimal,
    Key? key,
  }) : super(key: key);

  final Animal selectedAnimal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          selectedAnimal.enumToString(),
          style: context.textStyles.animalsHeaderTitle,
          textAlign: TextAlign.center,
        ),
        Text(
          'A ${selectedAnimal.enumToString()} fact generator',
          style: context.textStyles.animalsHeaderSubtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

extension AnimalToString on Animal {
  String enumToString() {
    if (this == Animal.cat) {
      return 'Cats';
    } else {
      return 'Dogs';
    }
  }
}
