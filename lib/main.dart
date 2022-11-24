import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_moisture/features/examine/presentation/bloc/recommed_crops_cubit.dart';
import 'package:soil_moisture/features/home/data/repository/image_input_repository.dart';
import 'package:soil_moisture/features/home/presentation/bloc/image_input_cubit.dart';

import 'core/observer/custom_bloc_observer.dart';
import 'core/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) => ImageInputRepositoryImp(),
        child: BlocProvider(
          create: (context) => ImageInputCubit(context.read<ImageInputRepositoryImp>()),
          child: BlocProvider(
            create: (context) => RecommedCropsCubit(),
            child: MaterialApp(
              title: 'Terreno',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: Routes.onGenerateRoute,
            ),
          ),
        ),
    );
  }
}
