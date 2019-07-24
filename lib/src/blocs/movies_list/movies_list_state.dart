import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_movies/src/models/movie_model.dart';

@immutable
abstract class MoviesListState extends Equatable {
  MoviesListState([List props = const []]) : super(props);
}

class Initial extends MoviesListState {
  @override
  String toString() {
    return 'Initial';
  }
}

class Loading extends MoviesListState {
  @override
  String toString() {
    return 'Loading';
  }
}

class Loaded extends MoviesListState {
  final List<Movie> movies;

  Loaded({this.movies}) : super([movies]);

  @override
  String toString() {
    return 'Loaded { size: ${movies.length} }';
  }
}

class Failure extends MoviesListState {
  final String message;

  Failure({this.message}) : super([message]);

  @override
  String toString() {
    return 'Failure { message: $message}';
  }
}
