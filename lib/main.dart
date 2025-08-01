import 'package:flutter/material.dart';
// import 'Pages/homepage.dart';
// import 'Pages/detailsPage.dart';
// import 'Pages/loginPage.dart';
import 'Pages/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainScreen(),
    );
  }
}

