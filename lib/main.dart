import 'package:bank_app/core/routes/app_routes.dart';
import 'package:bank_app/core/services/injection_container.dart';
import 'package:bank_app/core/services/storage_service.dart';
import 'package:bank_app/core/theme/config/app_theme.dart';
import 'package:bank_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initInjectionContainer();
  await initStorage();
  await bioController.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  themeController.loadThemeMode();
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
