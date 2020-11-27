part of 'definition_bloc.dart';

abstract class DefinitionState extends Equatable {
  const DefinitionState();
}

class DefinitionInitial extends DefinitionState {
  @override
  List<Object> get props => [];
}

class DefinitionError extends DefinitionState{
  String message;

  DefinitionError(this.message);

  @override
  // TODO: implement props
  List<Object> get props =>[message];
}

class DefinitionProgress extends DefinitionState{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}

class DefinitionSuccess extends DefinitionState{
  DefinitionM definitionM;

  DefinitionSuccess(this.definitionM);

  @override
  // TODO: implement props
  List<Object> get props =>[definitionM];
}