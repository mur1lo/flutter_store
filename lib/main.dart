import 'package:flutter/material.dart';
import 'telas/splash_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0052CC)),
        useMaterial3: true,
      ),
      home: const SplashTela(),
      debugShowCheckedModeBanner: false,
    );
  }
}
