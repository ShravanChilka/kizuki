import 'package:flutter/material.dart';

class ExploreListHeader extends StatelessWidget {
  const ExploreListHeader({Key? key}) : super(key: key);

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
