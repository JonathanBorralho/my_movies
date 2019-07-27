import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';
import './bloc.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final MovieRepository movieRepository;

  MoviesListBloc(this.movieRepository) : assert(movieRepository != null);

  @override
  MoviesListState get initialState => Initial();

  @override
  Stream<MoviesListState> mapEventToState(MoviesListEvent event) async* {
    if (event is Fetch) {
      yield Loading();

      try {
        List<Movie> movies = await movieRepository.findAll();
        yield Loaded(movies: movies);
      } catch (e) {
        yield Failure(message: 'Erro ao carregar lista de filmes.');
      }
    }
  }
}
