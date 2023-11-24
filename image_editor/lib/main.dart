import 'package:flutter/material.dart';

import 'features/home/presentation/home_page.dart';

void main() {
  runApp(const EnterApp());
}

/// Colocar todas as strings em inglês ou portugues apenas

class EnterApp extends StatelessWidget {
  const EnterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        // '/edit': (context) => const EditPage(),
        // '/share': (context) => const SharePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
