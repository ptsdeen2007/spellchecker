part of 'typing_bloc.dart';

abstract class TypingEvent extends Equatable {
  const TypingEvent();
}

class TypingStarted extends TypingEvent{
  String text;

  TypingStarted(this.text);

  @override
  // TODO: implement props
  List<Object> get props => [text];
}

class TypingWordSelected extends TypingEvent{
  String text;
  TypingWordSelected(this.text);

  @override
  // TODO: implement props
  List<Object> get props => [text];
}