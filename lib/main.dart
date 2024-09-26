import 'package:doubletaptoclose/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              return FilledButton(
                onPressed:()=> _goToSecondPage(context),
                child: const Text('Go To Second Page'),
              );
            }
          ),
        ),
      ),
    );
  }

  void _goToSecondPage(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) {
        return const SeconPage();
      },
    );

    Navigator.push(context, route);
  }
  
}
