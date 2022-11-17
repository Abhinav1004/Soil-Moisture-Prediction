import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soil_moisture/features/reading/data/models/reading_model.dart';
import 'package:soil_moisture/features/reading/domain/repository/reading_repository.dart';

part 'reading_state.dart';

class ReadingCubit extends Cubit<ReadingState> {
  ReadingCubit(this.repository) : super(ReadingInitial());
  final ReadingRepository repository;

  loadSoilReading() async {
    emit(ReadingLoading());
    try{
      var reading = await repository.getSoilReading();
      emit(ReadingLoaded(reading));
    }on Exception catch(err){
      emit(ReadingError(err));
    }
  }

  loadRiceDiseaseReading() async {
    emit(ReadingLoading());
    try{
      var reading = await repository.getRiceDiseaseReading();
      emit(ReadingLoaded(reading));
    }on Exception catch(err){
      emit(ReadingError(err));
    }
  }

  loadPestReading() async {
    emit(ReadingLoading());
    try{
      var reading = await repository.getPestReading();
      emit(ReadingLoaded(reading));
    }on Exception catch(err){
      emit(ReadingError(err));
    }
  }

  loadUsingJsonName(String jsonName){
    switch (jsonName) {
      case "soil":
        loadSoilReading();
        break;
      case "pest":
        loadPestReading();
        break;
      case "disease":
        loadRiceDiseaseReading();
        break;
    }
  }
}
