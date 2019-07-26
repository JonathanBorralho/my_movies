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
    if (event is Search) {
      final String searchTerm = event.query;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          yield* handleSearch(searchTerm);
        } catch (e) {
          yield SearchStateError(
            message: 'Houve um erro ao realizar pesquisa.',
          );
        }
      }
    }
  }

  Stream<MovieSearchState> handleSearch(String query) async* {
    List<Movie> movies = await movieRepository.search(query);
    yield SearchStateSuccess(movies: movies);
  }
}
