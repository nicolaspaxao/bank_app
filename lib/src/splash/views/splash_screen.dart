import 'package:bank_app/core/theme/config/app_theme.dart';
import 'package:bank_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.indigo),
        height: context.height,
        width: context.width,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Banco\nSnP',
                style: context.displayLarge!.copyWith(
                  fontFamily: rosarivo.bodyLarge!.fontFamily,
                  color: Colors.white,
                  fontSize: 64,
                ),
                textAlign: TextAlign.center,
              ),
              Container(width: 100, height: 3, color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
