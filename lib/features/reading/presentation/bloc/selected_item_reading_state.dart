part of 'selected_item_reading_cubit.dart';

@immutable
abstract class SelectedItemReadingState {
  final int at;
  const SelectedItemReadingState(this.at);
}

class SelectedItemReadingAt extends SelectedItemReadingState {
  const SelectedItemReadingAt(super.at);
}
