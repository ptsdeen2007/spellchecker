import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/repositories/dictionary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'typing_event.dart';

part 'typing_state.dart';

class TypingBloc extends Bloc<TypingEvent, TypingState> {
  TypingBloc() : super(TypingInitial());
//if the word is not there show the word
  @override
  Stream<TypingState> mapEventToState(TypingEvent event,) async* {
    if(event is TypingStarted){
      //to clear the word suggestion of word definition if search box is empty
      if(event.text.length<1){
        yield TypingResult([]);
      }else{
        try {
          String searchQuery=event.text;

          //to get suggestions from repository
          List<String> suggestions=await DictionaryRepository().getWordSuggestions(searchQuery);

          //suggestion length > meanse word is misspelled
          if(suggestions.length>0){
            yield TypingResult(suggestions);
          }else{
            yield await showResult(searchQuery);
          }
        } catch (e) {
          yield TypingResult([]);
        }
      }
      //TypingWordSelected event used to get data immediately without debouching
    }else if(event is TypingWordSelected){
      yield TypingProgress();
      String searchQuery=event.text;
      yield await showResult(searchQuery);
    }
  }

  @override
  Stream<Transition<TypingEvent, TypingState>> transformEvents(
      Stream<TypingEvent> events, transitionFn) {
      if(events is TypingStarted){
        //adding 500 millisecond gap for each request when user typing his words to avoid unnecessary request
        return events
            .debounceTime(const Duration(milliseconds: 500))
            .switchMap((transitionFn));
      }else{
        //override debounce for other events
        return events.switchMap(transitionFn);
      }
  }

  Future<TypingState> showResult(String searchQuery) async{
    DefinitionM definitionM=await DictionaryRepository().getWordDefinition(searchQuery);

    if(definitionM.error==null){
      //word definition found
      return TypingDefinition(definitionM);
    }else{
      //word definition not found
      return TypingError(definitionM.error);
    }
  }

}
