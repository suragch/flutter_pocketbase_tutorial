import 'package:flutter/material.dart';

void main() {
  runApp(const PocketBaseDemo());
}

class PocketBaseDemo extends StatelessWidget {
  const PocketBaseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('Sign up'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Sign in'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Sign out'),
          ),
        ]),
      ),
    );
  }
}
