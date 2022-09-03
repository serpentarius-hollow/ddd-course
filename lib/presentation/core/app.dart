import 'package:ddd_course/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DDD Course',
      home: SignInPage(),
    );
  }
}
