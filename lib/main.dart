import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

final LocalAuthentication _localAuth = LocalAuthentication();

bool isBiometricAvaiable = false;
bool canAuthenticate = false;

Future<bool> checkBiometric() async {
  return await _localAuth.canCheckBiometrics;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isBiometricAvaiable = await checkBiometric();
  canAuthenticate =
      (isBiometricAvaiable || await _localAuth.isDeviceSupported());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuthenticated = false;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> authBio() async {
    try {
      return await _localAuth.authenticate(
        localizedReason:
            'Precisamos validar sua digital para acessar os recursos.',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      ScaffoldMessenger(
        child: SnackBar(
          content: Text(e.toString()),
        ),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            isAuthenticated = await authBio();

            log(isAuthenticated.toString());

            if (isAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sucesso')),
              );
            }
          },
          child: const Text('Autenticar'),
        ),
      ),
    );
  }
}
