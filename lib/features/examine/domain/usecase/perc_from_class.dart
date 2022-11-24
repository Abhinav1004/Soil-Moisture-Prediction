import 'dart:math';

import '../../data/models/examine_ml_model.dart';

class PercFromClass{
  num call(List<ExamineMlModel> models ){

    if(models.first.label.toLowerCase()=="none"){
      return 0;
    }
    final moist = {
      "dry": 8,
      "regular": 18,
      "wet": 28,
      "soaked": 38
    };

    final moistPos = {
      "dry": 0,
      "regular": 1,
      "wet": 2,
      "soaked": 3
    };

    final max_moist = models.first.confidence;

    final pos = moistPos[models.first.label];

    var compareMoist = 0;


    var comparePos = -1;


    if(pos==0){
      comparePos = 0;
      compareMoist = models.singleWhere((element) => element.label.toLowerCase()==moist.keys.elementAt(1)).confidence;
    }else if(pos==3){
      comparePos = 3;
      compareMoist = models.singleWhere((element) => element.label.toLowerCase()==moist.keys.elementAt(2)).confidence;
    }else{
      final compare1 = models.singleWhere((element) => element.label.toLowerCase()==moist.keys.elementAt(pos!-1)).confidence;
      final compare2 = models.singleWhere((element) => element.label.toLowerCase()==moist.keys.elementAt(pos!+1)).confidence;
      if(compare1>compare2){
        comparePos = pos!-1;
        compareMoist  = compare1;
      }else{
        comparePos = pos!+1;
        compareMoist = compare2;
      }
    }

    num sum1 = (max_moist/(max_moist+compareMoist))*(moist[models.first.label.toLowerCase()])!.toInt();
    num sum2 = (compareMoist/(max_moist+compareMoist))*(moist.values.elementAt(comparePos));
    return sum1 + sum2;
  }
}