import 'package:flutter/material.dart';
import 'package:flutter_pocketbase_tutorial/home_page/home_page_manager.dart';

class PocketBaseDemo extends StatefulWidget {
  const PocketBaseDemo({super.key});

  @override
  State<PocketBaseDemo> createState() => _PocketBaseDemoState();
}

class _PocketBaseDemoState extends State<PocketBaseDemo> {
  final manager = HomePageManager();

  @override
  void initState() {
    super.initState();
    manager.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                ValueListenableBuilder<String>(
                    valueListenable: manager.statusNotifier,
                    builder: (context, status, child) {
                      return Text('Status: $status');
                    }),
                const SizedBox(height: 32),
                TaskButton(title: 'Sign up', onPressed: manager.signUp),
                TaskButton(title: 'Sign in', onPressed: manager.signIn),
                TaskButton(title: 'Refresh token', onPressed: manager.refresh),
                TaskButton(title: 'Sign out', onPressed: manager.signOut),
                const SizedBox(height: 32),
                TaskButton(title: 'Create', onPressed: manager.create),
                TaskButton(title: 'Read', onPressed: manager.read),
                TaskButton(title: 'Update', onPressed: manager.update),
                TaskButton(title: 'Delete', onPressed: manager.delete),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TaskButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: 150,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}
