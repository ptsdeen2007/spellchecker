import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dictionary/Bloc/search/search_event.dart';
import 'package:dictionary/repositories/dictionary_repository.dart';
import 'package:equatable/equatable.dart';


part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if(event is SearchNow){
      final String searchQuery = event.query;
      if (searchQuery.isEmpty) {
        yield SearchError("Enter the word which you want explore");
      }else{
        yield SearchProgress();
        try {
         List<String> suggestions=await DictionaryRepository().getWordSuggestions(searchQuery);
         /* List<String> suggestions;
          if(searchQuery=="this"){
             suggestions=[];
          }else{
            suggestions=['this','thisis','thatis'];
          }*/
         if(suggestions.length>0){
           yield SearchWrongText(suggestions);
         }else{
           yield SearchSuccess();
         }
        } catch (e) {
         yield SearchError(e.toString());
        }

      }
    }
  }
}
