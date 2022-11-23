import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'recommed_crops_state.dart';

class RecommedCropsCubit extends Cubit<RecommedCropsState> {
  RecommedCropsCubit() : super(RecommedCropsInitial());

   final soilMoistureDict = const {
    "dry": [
      "stonecrop",
      "lavender",
      "sage",
      "grasses",
      "Salix",
      "Potato"
    ],
    "wet":[
      "CardinalFlower",
      "Salix",
      "PineOak",
      "royalFern"
    ],
    "soaked":[
      "marshMangold",
      "Hibiscus",
      "Daylily",
      "Iris"
    ],
    "regular": [
      "Corn",
      "Cabbage",
      "Ginger",
      "Garlic",
      "Turmeric"
    ]
  };

  final soilTypeDict = const {
    "stonecrop": "Red Sandy Soil",
    "lavender": "Coastal Alluvial Soil",
    "sage": "Laterite Soil",
    "grasses": "Red loamy Soil",
    "Potato": "Red yellow soil",
    "CardinalFlower": "Coastal Alluvial Soil",
    "Salix": "Red Sandy Soil",
    "PineOak": "Red yellow soil",
    "royalFern": "Coastal Alluvial Soil",
    "marshMangold": "Laterite Soil",
    "Hibiscus": "Red loamy Soil",
    "Daylily": "Red yellow soil",
    "Iris": "Red Sandy Soil",
    "Corn": "Red yellow soil",
    "Cabbage": "Coastal Alluvial Soil",
    "Ginger": "Red Sandy Soil",
    "Rice": "Red loamy Soil",
    "Garlic": "Coastal Alluvial Soil",
    "Turmeric": "Laterite Soil"
  };


  filterBySoilMoisture(String moisture){
    var soilType = "";
    var result = soilMoistureDict[moisture]??[];
    if(state is RecommedCropsFilter){
      soilType = (state as RecommedCropsFilter).type;
    }
    emit(RecommedCropsFilter(moisture: moisture, type: soilType, result: result));
  }

  filterBySoilType(String type){
    var moisture = "";
    if(state is! RecommedCropsFilter){
      return;
    }
    moisture = (state as RecommedCropsFilter).moisture;
    var result = soilMoistureDict[moisture]??[];
    print(result);
    var selectedSoilTypeDict = Map.from(soilTypeDict);
    selectedSoilTypeDict.removeWhere((key, value) => value!=type);
    var mainResult = result.where((element) => selectedSoilTypeDict.containsKey(element)).toList();
    print(soilTypeDict);
    print(mainResult);
    emit(RecommedCropsFilter(moisture: moisture, type: type, result: mainResult));
  }

  search(String query){
    if(state is! RecommedCropsFilter){
      return;
    }
    final moisture = (state as RecommedCropsFilter).moisture;
    final soilType = (state as RecommedCropsFilter).type;
    var result = soilMoistureDict[moisture]??[];
    print(result);
    var selectedSoilTypeDict = Map.from(soilTypeDict);
    if(soilType.isNotEmpty){
      selectedSoilTypeDict.removeWhere((key, value) => value!=soilType);
    }
    var mainResult = result.where((element) => selectedSoilTypeDict.containsKey(element)).toList();
    if(query.isEmpty){
      emit(RecommedCropsFilter(moisture: moisture, type: soilType, result: mainResult));
      return;
    }
    var output = mainResult.where((element) => element.startsWith(query)).toList();
    emit(RecommedCropsFilter(moisture: moisture, type: soilType, result: output));
  }
}
