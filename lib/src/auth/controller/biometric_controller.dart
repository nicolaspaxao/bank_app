import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricNotifier extends ChangeNotifier {
  late LocalAuthentication _localAuth;

  LocalAuthentication get localAuth => _localAuth;

  bool isBiometricAvaiable = false;
  bool canAuthenticate = false;

  bool isAuthenticated = false;

  Future<void> init() async {
    _localAuth = LocalAuthentication();
    isBiometricAvaiable = await _localAuth.canCheckBiometrics;
    canAuthenticate =
        (isBiometricAvaiable || await _localAuth.isDeviceSupported());
  }

  Future<void> authBio() async {
    try {
      isAuthenticated = await _localAuth.authenticate(
        localizedReason:
            'Precisamos validar sua digital para acessar os recursos.',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      ScaffoldMessenger(child: SnackBar(content: Text(e.toString())));
      isAuthenticated = false;
    }
    notifyListeners();
  }
}
