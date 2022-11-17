import 'package:soil_moisture/features/reading/data/models/reading_model.dart';

abstract class ReadingRepository{
  Future<List<ReadingModel>> getSoilReading();
  Future<List<ReadingModel>> getPlantReading();
  Future<List<ReadingModel>> getPestReading();
}