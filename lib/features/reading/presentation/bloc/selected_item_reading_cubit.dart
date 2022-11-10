import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_item_reading_state.dart';

class SelectedItemReadingCubit extends Cubit<SelectedItemReadingState> {
  SelectedItemReadingCubit() : super(SelectedItemReadingAt(-1));

  void selectedAt(int at){
    emit(SelectedItemReadingAt(at));
  }

  void deselect(){
    emit(SelectedItemReadingAt(-1));
  }
}
