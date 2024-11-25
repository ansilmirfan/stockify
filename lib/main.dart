import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:stockify/features/data/model/watch_list_model.dart';
import 'package:stockify/features/presentation/pages/home.dart';
import 'package:stockify/features/presentation/provider/api_data.dart';
import 'package:stockify/features/presentation/provider/local_storage.dart';
import 'package:stockify/features/presentation/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WatchListModelAdapter());
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
        ChangeNotifierProvider(
          create: (context) => ApiData(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalStorage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.themeData,
        home: const Home(),
      ),
    );
  }
}
