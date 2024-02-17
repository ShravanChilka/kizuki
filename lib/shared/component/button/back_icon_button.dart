import 'package:flutter/material.dart';

import '../../../config/route/router.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          Colors.black,
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color(0xFFE6E6E6),
        ),
      ),
      onPressed: onPressed ?? () => AppRouter.instance.pop(),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }
}
