
import 'package:examweekthree/list_item.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : const listItem(), 
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 5,
        ),
      ),
    );
  }
}
