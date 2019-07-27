import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movie_search/bloc.dart';
import 'package:my_movies/src/blocs/movies_list/bloc.dart';
import 'package:my_movies/src/pages/home/home_page.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';
import 'package:my_movies/src/services/search_cache_service.dart';
import 'package:my_movies/src/util/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  final MovieRepository movieRepository = MovieRepository(SearchCache());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movies',
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieSearchBloc>(
            builder: (context) => MovieSearchBloc(movieRepository),
          ),
          BlocProvider<MoviesListBloc>(
            builder: (context) =>
                MoviesListBloc(movieRepository)..dispatch(Fetch()),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
