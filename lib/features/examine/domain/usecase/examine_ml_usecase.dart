import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';


class ExamineMlUseCase{
  final File imageFile;
  ExamineMlUseCase(this.imageFile);

  call() async {
    String? res = await Tflite.loadModel(
      model: "assets/model/output.tflite",
      labels: "assets/model/labels.txt",
      numThreads: 1, // defaults to 1
      isAsset: true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );


    var recognitions = await Tflite.runModelOnImage(
      path: imageFile.path,   // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 4,    // defaults to 5
      threshold: 0,   // defaults to 0.1
      asynch: true      // defaults to true
    );

    debugPrint(recognitions.toString());

    

    await Tflite.close();
  }
}