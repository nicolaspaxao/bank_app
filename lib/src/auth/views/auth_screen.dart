import 'package:bank_app/core/services/injection_container.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListenableBuilder(
          listenable: bioController,
          builder: (_, child) {
            return ElevatedButton(
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
            );
          },
        ),
      ),
    );
  }
}
