import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';
import './bloc.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final MovieRepository movieRepository;

  MovieSearchBloc({this.movieRepository});

  @override
  MovieSearchState get initialState => Initial();

  @override
  Stream<MovieSearchState> mapEventToState(MovieSearchEvent event) async* {
    if (event is Search) {
      yield MovieSearchLoading();

      try {
        yield* handleSearch(event.query);
      } catch (e) {
        yield MovieSearchFailure(
          message: 'Houve um erro ao realizar pesquisa.',
        );
      }
    }
  }

  Stream<MovieSearchState> handleSearch(String query) async* {
    List<Movie> movies = await movieRepository.search(query);
    if (movies.isNotEmpty) {
      yield MovieSearchLoaded(movies: movies);
    } else {
      yield NoResults(message: 'Nenhum resultado encontrado...');
    }
  }
}
