import 'package:flutter/material.dart';

import 'config/route/router.dart';

void application() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ApplicationRouter.router,
      routeInformationParser: ApplicationRouter.router.routeInformationParser,
      routerDelegate: ApplicationRouter.router.routerDelegate,
    );
  }
}
