part of 'reading_cubit.dart';

@immutable
abstract class ReadingState {}

class ReadingInitial extends ReadingState {}

class ReadingLoading extends ReadingState {}

class ReadingLoaded extends ReadingState {
  final List<ReadingModel> readings;
  ReadingLoaded(this.readings);
}

class ReadingError extends ReadingState {
  final Exception err;
  ReadingError(this.err);
}



