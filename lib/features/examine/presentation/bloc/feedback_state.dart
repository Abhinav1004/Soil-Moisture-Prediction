part of 'feedback_cubit.dart';

@immutable
abstract class FeedbackState {}

class FeedbackInitial extends FeedbackState {}

class FeedbackSending extends FeedbackState {
  final bool wasHelpfull;
  FeedbackSending(this.wasHelpfull);
}

class FeedbackSent extends FeedbackState {
  final bool wasHelpfull;
  FeedbackSent(this.wasHelpfull);
}


