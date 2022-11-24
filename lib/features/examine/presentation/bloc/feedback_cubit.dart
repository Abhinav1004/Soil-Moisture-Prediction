import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soil_moisture/features/examine/domain/repository/feedback_repository.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit(this.repository) : super(FeedbackInitial());
  FeedbackRepository repository;

  upVoteFeedback(File image, String label) async{
    emit(FeedbackSending(true));
    await repository.sendFeedback(true, label, image);
    emit(FeedbackSent(true));
  }

  downVoteFeedback(File image, String label) async{
    emit(FeedbackSending(false));
    await repository.sendFeedback(false, label, image);
    emit(FeedbackSent(false));
  }
}
