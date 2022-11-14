import 'package:rice_disease_detect/features/reading/data/models/reading_model.dart';

abstract class ReadingRepository{
  Future<List<ReadingModel>> getSoilReading();
  Future<List<ReadingModel>> getRiceDiseaseReading();
  Future<List<ReadingModel>> getPestReading();
}