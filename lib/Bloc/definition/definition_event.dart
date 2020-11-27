part of 'definition_bloc.dart';

abstract class DefinitionEvent extends Equatable {
  const DefinitionEvent();
}

class DefinitionFind extends DefinitionEvent{
  String word;

  DefinitionFind(this.word);

  @override
  // TODO: implement props
  List<Object> get props => [word];
}