import 'package:flutter/material.dart';
import 'package:flutter_app_gridview/home.dart';
import 'package:flutter_app_gridview/screens/welcome/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      home: WelcomeScreen(),
    
    );
  }
}
