import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dictionary/Bloc/search/search_event.dart';
import 'package:dictionary/repositories/dictionary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'typing_event.dart';

part 'typing_state.dart';

class TypingBloc extends Bloc<TypingEvent, TypingState> {
  TypingBloc() : super(TypingInitial());

  @override
  Stream<TypingState> mapEventToState(TypingEvent event,) async* {
    if(event is TypingStarted){
      if(event.text.length<3){
        yield TypingResult([]);
      }else{
        try {
          List<String> suggestions=await DictionaryRepository().getWordSuggestions(event.text);
          /* List<String> suggestions;
          if(searchQuery=="this"){
             suggestions=[];
          }else{
            suggestions=['this','thisis','thatis'];
          }*/
          if(suggestions.length>0){
            yield TypingResult(suggestions);
          }else{
            yield TypingResult([]);
          }
        } catch (e) {
          yield TypingResult([]);
        }
      }
    }
  }

  @override
  Stream<Transition<TypingEvent, TypingState>> transformEvents(
      Stream<TypingEvent> events, transitionFn) {
    return events
        // .where((event) =>(event is TypingStarted) && event.text.length>3)
        .debounceTime(const Duration(milliseconds: 500))
        .switchMap((transitionFn));
  }

}
