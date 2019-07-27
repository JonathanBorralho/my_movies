import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';
import './bloc.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final MovieRepository movieRepository;

  MovieSearchBloc({this.movieRepository});

  @override
  MovieSearchState get initialState => SearchStateEmpty();

  @override
  Stream<MovieSearchState> mapEventToState(MovieSearchEvent event) async* {
    if (event is SearchButtonPressed) {
      final String searchTerm = event.query;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        yield* handleSearch(searchTerm);
      }
    }
  }

  Stream<MovieSearchState> handleSearch(String query) async* {
    try {
      List<Movie> movies = await movieRepository.search(query);
      yield SearchStateSuccess(movies: movies);
    } catch (e) {
      yield SearchStateError(
        message: 'Houve um erro ao realizar sua pesquisa.',
      );
    }
  }
}
