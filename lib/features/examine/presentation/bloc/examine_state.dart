part of 'examine_cubit.dart';

@immutable
abstract class ExamineState {}

class ExamineInitial extends ExamineState {}

class ExamineStarted extends ExamineState {
  final File imageFile;
  ExamineStarted(this.imageFile);
}

class ExamineDone extends ExamineState {
  final ExamineMlModel moisture;
  final List<ExamineMlModel> moisturesList;
  final double perc;
  ExamineDone(this.moisture, this.moisturesList, this.perc);
}

class ExamineError extends ExamineState {
  final Exception err;
  ExamineError(this.err);
}


