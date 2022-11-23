part of 'image_input_cubit.dart';

@immutable
abstract class ImageInputState {}

class ImageInputInitial extends ImageInputState {}

class ImageInputCapturing extends ImageInputState {}

class ImageInputShowingMsg extends ImageInputState {
  final ImageInputEnum type;
  ImageInputShowingMsg(this.type);
}


class ImageInputCaptured extends ImageInputState {
  final File imageFile;
  ImageInputCaptured(this.imageFile);
}

class ImageInputError extends ImageInputState{
  final Exception exception;
  ImageInputError(this.exception);
}