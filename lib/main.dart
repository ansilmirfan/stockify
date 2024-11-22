import 'package:flutter/material.dart';
import 'package:stockify/features/presentation/pages/home.dart';
import 'package:stockify/features/presentation/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      home: const Home(),
    );
  }
}
