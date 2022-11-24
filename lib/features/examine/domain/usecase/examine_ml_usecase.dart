import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soil_moisture/core/error/exception.dart';
import 'package:soil_moisture/features/examine/data/models/examine_ml_model.dart';
import 'package:tflite/tflite.dart';


class ExamineMlUseCase{
  final File imageFile;
  ExamineMlUseCase(this.imageFile);

  call() async {
    String? res = await Tflite.loadModel(
      model: "assets/model/model_unquant_with_none.tflite",
      labels: "assets/model/labels_unquant_none.txt",
      numThreads: 1, // defaults to 1
      isAsset: true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );

    print(res);


    var recognitions = await Tflite.runModelOnImage(
      path: imageFile.path,   // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 5,    // defaults to 5
      threshold: 0,   // defaults to 0.1
      asynch: true      // defaults to true
    );

    print(recognitions.toString());

    Tflite.close();

    if(recognitions==null){
      throw MachineLearningRelException("Cannot recognise the image");
    }

    List<ExamineMlModel> predictions = recognitions.map((e) => ExamineMlModel.fromMap(Map<String, dynamic>.from(e))).toList();

    

    return predictions;
  }
}