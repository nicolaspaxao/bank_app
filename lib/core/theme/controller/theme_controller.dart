import 'package:bank_app/core/services/storage_service.dart';
import 'package:flutter/material.dart';

abstract class ThemeModeEnum {
  static String light = 'light';
  static String dark = 'dark';
}

class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  Future<void> loadThemeMode() async {
    String? result = prefs.getString(StorageKeys.theme);
    if (result != null) {
      if (result == ThemeModeEnum.light) {
        themeMode = ThemeMode.light;
      } else if (result == ThemeModeEnum.dark) {
        themeMode = ThemeMode.dark;
      }
    } else {
      themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void changeTheme() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
      setTheme(ThemeModeEnum.light);
    } else {
      themeMode = ThemeMode.dark;
      setTheme(ThemeModeEnum.dark);
    }
    notifyListeners();
  }

  Future<void> setTheme(String theme) async {
    await prefs.setString(StorageKeys.theme, theme);
    notifyListeners();
  }
}
