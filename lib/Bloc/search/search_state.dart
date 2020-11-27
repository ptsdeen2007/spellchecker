part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchProgress extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchWrongText extends SearchState {
  List<String> suggestions;

  SearchWrongText(this.suggestions);

  @override
  List<Object> get props => [suggestions];
}
class SearchError extends SearchState {
  String message;

  SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchSuccess extends SearchState {
  @override
  List<Object> get props => [];
}

