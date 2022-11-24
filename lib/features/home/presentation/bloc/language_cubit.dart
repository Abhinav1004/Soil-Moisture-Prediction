import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageEnglish());

  changeLanguage(){
    if(state is LanguageEnglish){
      emit(LanguageHindi());
    }else{
      emit(LanguageEnglish());
    }
  }
}
