import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rice_disease_detect/core/observer/custom_bloc_observer.dart';
import 'package:rice_disease_detect/features/examine/presentation/pages/examine/examine_page.dart';
import 'package:rice_disease_detect/features/home/data/repository/image_input_repository.dart';
import 'package:rice_disease_detect/features/home/presentation/bloc/image_input_cubit.dart';
import 'package:rice_disease_detect/features/home/presentation/components/examine_crop_area.dart';
import 'package:rice_disease_detect/features/home/presentation/pages/home/home_page.dart';
import 'package:rice_disease_detect/features/reading/presentation/pages/reading/reading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
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
        "/reading": (_)=> const ReadingPage(),
        "/examine": (_)=> const ExaminePage()
      },
    );
  }
}
