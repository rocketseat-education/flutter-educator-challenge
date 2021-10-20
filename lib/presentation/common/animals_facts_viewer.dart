import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:rocketseat_educator_ps/data/remote/model/fact.dart';

import 'theme/theme_utils.dart';

class AnimalsFactsViewer extends StatelessWidget {
  const AnimalsFactsViewer({
    required this.onNextTap,
    required this.fact,
    Key? key,
  }) : super(key: key);

  final VoidCallback onNextTap;
  final Fact fact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 24),
            child: Text(
              '"${fact.label}"',
              style: context.textStyles.animalFact,
            ),
          ),
        ),
        IconButton(
          iconSize: 80,
          onPressed: onNextTap,
          color: context.colors.animalsImageViewerArrow,
          icon: const Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }
}
