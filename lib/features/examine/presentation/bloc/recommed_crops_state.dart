part of 'recommed_crops_cubit.dart';

abstract class RecommedCropsState {}

class RecommedCropsInitial extends RecommedCropsState {}

class RecommedCropsFilter extends RecommedCropsState {
  final String moisture;
  final String type;
  final List<String> result;
  RecommedCropsFilter({required this.moisture, required this.type, required this.result});
}


