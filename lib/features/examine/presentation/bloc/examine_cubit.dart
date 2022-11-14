import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rice_disease_detect/features/examine/domain/usecase/examine_ml_usecase.dart';

part 'examine_state.dart';

class ExamineCubit extends Cubit<ExamineState> {
  ExamineCubit() : super(ExamineInitial());

  void startExamine(File imageFile){
    emit(ExamineStarted(imageFile));
    ExamineMlUseCase examineMlUseCase = ExamineMlUseCase(imageFile);
    examineMlUseCase();
  }
}
