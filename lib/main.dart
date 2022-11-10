import 'package:flutter/material.dart';
import 'package:rice_disease_detect/features/home/presentation/pages/home/home_page.dart';
import 'package:rice_disease_detect/features/reading/presentation/pages/reading/reading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rice Disease Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (_)=> const HomePage(),
        "/reading": (_)=> const ReadingPage()
      },
    );
  }
}
