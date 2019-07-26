import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_movies/src/models/movie_model.dart';

@immutable
abstract class MovieSearchState extends Equatable {
  MovieSearchState([List props = const []]) : super(props);
}

class SearchStateEmpty extends MovieSearchState {
  @override
  String toString() => 'SearchStateEmpty';
}

class SearchStateLoading extends MovieSearchState {
  @override
  String toString() => 'SearchStateLoading';
}

class SearchStateSuccess extends MovieSearchState {
  final List<Movie> movies;

  SearchStateSuccess({this.movies}) : super([movies]);

  @override
  String toString() => 'SearchStateSuccess { size: ${movies.length} }';
}

class SearchStateError extends MovieSearchState {
  final String message;

  SearchStateError({this.message}) : super([message]);

  @override
  String toString() => 'SearchStateError { message: $message}';
}
