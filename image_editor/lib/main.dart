import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'features/home/presentation/home_page.dart';

void main() {
  runApp(const EnterApp());
}

class EnterApp extends StatelessWidget {
  const EnterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          // '/edit': (context) => const EditPage(),
          // '/share': (context) => const SharePage(),
        },
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
