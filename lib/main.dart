import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/result.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0D22),
        scaffoldBackgroundColor: Color(0xff0A0D22),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}
