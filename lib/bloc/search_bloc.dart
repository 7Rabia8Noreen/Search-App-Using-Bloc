import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app_using_bloc/bloc/search_event.dart';
import 'package:search_app_using_bloc/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(LoadedState(words)) {
    on<SearchWord>((event, emit) {
      List<String> searchedTitles = [];
      for (var element in words) {
        if (element.contains(event.word)) {
          searchedTitles.add(element);
        }
      }
      emit(LoadedState(searchedTitles));
    });
  }

  static List<String> words = [
    'flutter',
    'google',
    'programming',
    'flutter bloc',
    'technology',
    'buisiness',
  ];
}
