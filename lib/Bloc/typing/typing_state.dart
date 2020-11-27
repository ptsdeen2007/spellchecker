part of 'typing_bloc.dart';

abstract class TypingState extends Equatable {
  const TypingState();
}

class TypingInitial extends TypingState {
  @override
  List<Object> get props => [];
}

class TypingResult extends TypingState{
  List<String> listItems;

  TypingResult(this.listItems);

  @override
  // TODO: implement props
  List<Object> get props => [listItems];

}