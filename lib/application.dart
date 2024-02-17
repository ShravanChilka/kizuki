import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di/injector.dart' as di;
import 'config/route/router.dart';
import 'firebase_options.dart';
import 'global_provider.dart';

void application() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.debug,
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  // );
  await FlutterDownloader.initialize(debug: kDebugMode);
  await di.init();
  runApp(const Application());
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, _) {
        return GlobalProvider(
          child: MaterialApp.router(
            scaffoldMessengerKey: scaffoldMessengerKey,
            routerConfig: AppRouter.instance,
            theme: ThemeData.dark(
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
