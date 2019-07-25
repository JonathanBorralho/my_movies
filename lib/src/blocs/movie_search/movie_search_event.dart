import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieSearchEvent extends Equatable {
  MovieSearchEvent([List props = const []]) : super(props);
}

class Search extends MovieSearchEvent {
  final String query;

  Search({this.query}) : super([query]);

  @override
  String toString() {
    return 'Search { query: $query }';
  }
}
