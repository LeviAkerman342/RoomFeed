import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/core/router/router.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('appBox'); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      routerConfig: router, 
    );
  }
}
