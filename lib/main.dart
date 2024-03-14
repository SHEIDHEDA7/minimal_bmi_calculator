// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // For Appbars and all
        primaryColor: Color(0xFF0A0E21), // Add 0xFF to any hex code copied
        // For Scaffold
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        //Secondart
        // For Text
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.white, fontSize: 15.0),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20.0),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//           primary: Color(0xFF0A0E21),
//           background: Color(0xFF0A0E21),
//           // ···
//           brightness: Brightness.light,
//         ),
//       ),

// ThemeData.dark(), For dark theme
// To make changes from current dark theme default theme
// ThemeData.dark().copyWith(
//   primaryColor: Color(0xFF0A0E21),
//   scaffoldBackgroundColor: Color(0xFF0A0E21),
// ),

// Suppose we want to change theme for a particular page or any button, wrap it with Theme, with data arg and then add ThemeData
