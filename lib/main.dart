import 'dart:async';

import 'package:bank_app/core/routes/app_routes.dart';
import 'package:bank_app/core/services/injection_container.dart';
import 'package:bank_app/core/services/storage_service.dart';
import 'package:bank_app/core/theme/config/app_theme.dart';
import 'package:bank_app/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late FirebaseAnalytics instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initInjectionContainer();
  await initStorage();
  await bioController.init();
  themeController.loadThemeMode();
  instance = FirebaseAnalytics.instance;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    return true;
  };

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      builder: (_, child) {
        return MaterialApp.router(
          themeAnimationCurve: Curves.easeInOut,
          themeAnimationDuration: const Duration(milliseconds: 400),
          themeMode: themeController.themeMode,
          darkTheme: themeDark,
          theme: themeLight,
          title: 'Bank App',
          routerConfig: router,
        );
      },
      listenable: themeController,
    );
  }
}
