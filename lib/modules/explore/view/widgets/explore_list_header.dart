import 'package:flutter/material.dart';

class ExploreListHeader extends StatelessWidget {
  const ExploreListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Explore',
          style: Theme.of(context).textTheme.displayMedium,
        )
      ],
    );
  }
}
