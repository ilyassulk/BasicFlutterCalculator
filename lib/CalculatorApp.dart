import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/main_screen/view/main_screen.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => MainCalcScreen(),
      },
      initialRoute: '/',
    );
  }
}
