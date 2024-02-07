import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/di/injector.dart' as di;
import 'config/route/router.dart';
import 'firebase_options.dart';
import 'global_provider.dart';

void application() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  await di.init();
  runApp(const Application());
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: MaterialApp.router(
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: ApplicationRouter.router,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
      ),
    );
  }
}
