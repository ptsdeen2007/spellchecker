import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/repositories/dictionary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'definition_event.dart';
part 'definition_state.dart';

class DefinitionBloc extends Bloc<DefinitionEvent, DefinitionState> {
  DefinitionBloc() : super(DefinitionInitial());

  @override
  Stream<DefinitionState> mapEventToState(
    DefinitionEvent event,
  ) async* {
   if(event is DefinitionFind){
     yield DefinitionProgress();
     try {
      DefinitionM definitionM=await DictionaryRepository().getWordDefinition(event.word);
      yield DefinitionSuccess(definitionM);
     } catch (e) {
       yield DefinitionError(e.toString());
     }
   }
  }
}
