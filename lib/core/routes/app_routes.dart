import 'package:bank_app/core/services/storage_service.dart';
import 'package:bank_app/src/auth/views/auth_screen.dart';
import 'package:bank_app/src/onboarding/views/onboarding_screen.dart';
import 'package:bank_app/src/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: SplashScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      redirect: (context, state) async {
        bool? isOnboardingPassed = prefs.getBool(StorageKeys.onboarding);

        return (isOnboardingPassed == null || isOnboardingPassed)
            ? OnboardingScreen.routeName
            : AuthScreen.routeName;
      },
    ),
    GoRoute(
      path: OnboardingScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: AuthScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthScreen();
      },
    ),
  ],
);
