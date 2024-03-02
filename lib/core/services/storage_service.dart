import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

abstract class StorageKeys {
  static String theme = 'theme';
  static String onboarding = 'onboarding';
}

Future<void> initStorage() async {
  prefs = await SharedPreferences.getInstance();
}
