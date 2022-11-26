import 'package:flutter/material.dart';
import 'package:sicipe/splash_screen.dart';

void main() {
  runApp(SiCipe());
}

class SiCipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SiCipe',
      home: SplashScreen(),
    );
  }
}
