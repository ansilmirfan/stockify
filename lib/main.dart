import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:stockify/features/presentation/pages/home.dart';
import 'package:stockify/features/presentation/provider/api_data.dart';
import 'package:stockify/features/presentation/themes/themes.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ApiData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.themeData,
        home: const Home(),
      ),
    );
  }
}
