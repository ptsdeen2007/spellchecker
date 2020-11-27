


import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchNow extends SearchEvent{
  String query;

  SearchNow(this.query);

  @override
  // TODO: implement props
  List<Object> get props => [query];
}


