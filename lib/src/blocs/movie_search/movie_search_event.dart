import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieSearchEvent extends Equatable {
  MovieSearchEvent([List props = const []]) : super(props);
}

class SearchButtonPressed extends MovieSearchEvent {
  final String query;

  SearchButtonPressed({this.query}) : super([query]);

  @override
  String toString() {
    return 'SearchButtonPressed { query: $query }';
  }
}
