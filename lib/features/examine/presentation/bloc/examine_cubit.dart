import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rice_disease_detect/features/examine/data/models/examine_ml_model.dart';
import 'package:rice_disease_detect/features/examine/domain/usecase/examine_ml_usecase.dart';

part 'examine_state.dart';

class ExamineCubit extends Cubit<ExamineState> {
  ExamineCubit() : super(ExamineInitial());

  startExamine(File imageFile) async{
    emit(ExamineStarted(imageFile));
    try{
      ExamineMlUseCase examineMlUseCase = ExamineMlUseCase(imageFile);
      List<ExamineMlModel> predictions = await examineMlUseCase();
      emit(ExamineDone(predictions));
    }on Exception catch(err){
      emit(ExamineError(err));
    }
  }
}
