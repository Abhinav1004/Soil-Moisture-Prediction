import 'dart:io';

abstract class FeedbackRepository{
  Future<void> sendFeedback(bool wasHelpful, String label, File image);
}