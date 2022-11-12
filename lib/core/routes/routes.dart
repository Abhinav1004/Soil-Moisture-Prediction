import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rice_disease_detect/features/examine/presentation/pages/examine/examine_page.dart';
import 'package:rice_disease_detect/features/home/presentation/pages/home/home_page.dart';
import 'package:rice_disease_detect/features/reading/presentation/pages/reading/reading_page.dart';

class Routes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      case "/reading":
        return MaterialPageRoute(builder: (context) {
          return const ReadingPage();
        });
      case "/examine":
        if(settings.arguments is File){
          File image = settings.arguments as File;
          return MaterialPageRoute(builder: (context) {
            return ExaminePage(imageFile: image);
          });
        }
    }
    return null;
  }
}