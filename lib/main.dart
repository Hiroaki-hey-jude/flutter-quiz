import 'package:flutter/material.dart';
import 'package:quiz/screen/splash.dart';
import 'package:quiz/screen/top_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      theme: ThemeData.light(),
    );
  }
}


