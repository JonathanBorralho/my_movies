import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_movies/src/models/movie_model.dart';

@immutable
abstract class MovieSearchState extends Equatable {
  MovieSearchState([List props = const []]) : super(props);
}

class Initial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {
  @override
  String toString() {
    return 'MovieSearchLoading';
  }
}

class MovieSearchLoaded extends MovieSearchState {
  final List<Movie> movies;

  MovieSearchLoaded({this.movies}) : super([movies]);

  @override
  String toString() {
    return 'MovieSearchLoaded { size: ${movies.length} }';
  }
}

class NoResults extends MovieSearchState {
  final String message;

  NoResults({this.message}) : super([message]);

  @override
  String toString() {
    return 'NoResults { message: $message }';
  }
}

class MovieSearchFailure extends MovieSearchState {
  final String message;

  MovieSearchFailure({this.message}) : super([message]);

  @override
  String toString() {
    return 'MovieSearchFailure { message: $message}';
  }
}

