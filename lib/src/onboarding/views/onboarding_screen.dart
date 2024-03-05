import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static String routeName = '/introducao';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () => throw Exception(),
                child: const Text('Teste de exceção')),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAnalytics.instance.logEvent(
                    parameters: {
                      "elementName": 'Clique no teste',
                      "step": '1',
                    },
                    name: 'clique',
                  );
                },
                child: const Text('Teste de analytics')),
          ],
        ),
      ),
    );
  }
}
