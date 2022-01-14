import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/screens/landing_screen.dart';
import 'package:flutter_anime_demo/utils/constants.dart';

void main() {
  // TODO: Connect to FireBase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get screen width of our device
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        accentColor: COLOR_DARK_BLUE,
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
        // TODO: Add font here
      ),
      home: LandingScreen(),
    );
  }
}
