import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soil_moisture/features/reading/data/models/reading_model.dart';
import 'package:soil_moisture/features/reading/domain/repository/reading_repository.dart';

class ReadingRepositoryImp extends ReadingRepository{
  @override
  Future<List<ReadingModel>> getPestReading() async {
    return (await rootBundle.loadStructuredData("assets/readings/pest.json", (value) async {
      List soils = json.decode(value);
      return soils.map((e) => ReadingModel.fromMap(e));
    })).toList();
  }

  @override
  Future<List<ReadingModel>> getPlantReading() async {
    return (await rootBundle.loadStructuredData("assets/readings/plant.json", (value) async {
      List soils = json.decode(value);
      return soils.map((e) => ReadingModel.fromMap(e));
    })).toList();
  }

  @override
  Future<List<ReadingModel>> getSoilReading() async{
    return (await rootBundle.loadStructuredData("assets/readings/soil.json", (value) async {
      List soils = json.decode(value);
      return soils.map((e) => ReadingModel.fromMap(e));
    })).toList();
  }
}