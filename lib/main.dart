import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantake/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  // await GetStorage.init(); // initializing getStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.grey.shade300,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
        ),
        home: const MyHomePage());
  }
}
