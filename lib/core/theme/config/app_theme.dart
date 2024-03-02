import 'package:bank_app/core/theme/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Pallet.primaryColor,
    brightness: Brightness.light,
  ),
  textTheme: textTheme(Colors.black26),
);

ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Pallet.secondaryColor,
    brightness: Brightness.dark,
  ),
  textTheme: textTheme(Colors.white),
);

TextTheme textTheme(Color color) {
  return roboto
    ..displayLarge!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..displayMedium!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..displaySmall!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..headlineLarge!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..headlineMedium!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..headlineSmall!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..titleLarge!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..titleMedium!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..titleSmall!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..bodyLarge!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..bodyMedium!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..bodySmall!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..labelLarge!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..labelMedium!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5)
    ..labelSmall!.copyWith(color: color, letterSpacing: .5, wordSpacing: .5);
}

final montSerrat = GoogleFonts.montserratTextTheme();
final roboto = GoogleFonts.robotoMonoTextTheme();
final rosarivo = GoogleFonts.rosarivoTextTheme();
