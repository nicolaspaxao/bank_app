import 'package:bank_app/core/services/injection_container.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const routeName = '/login';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListenableBuilder(
          listenable: bioController,
          builder: (_, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  child: const Text('Autenticar'),
                  onPressed: () async {
                    if (bioController.canAuthenticate) {
                      await bioController.authBio().then((value) {
                        if (bioController.isAuthenticated) {
                          ScaffoldMessenger.of(_).showSnackBar(
                            const SnackBar(content: Text('Sucesso')),
                          );
                        }
                      });
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text('Theme change'),
                  onPressed: () async {
                    themeController.changeTheme();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
