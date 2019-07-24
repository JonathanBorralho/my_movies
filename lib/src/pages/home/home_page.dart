import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movies_list/bloc.dart';
import 'package:my_movies/src/pages/home/movies_list.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Melhores Filmes'),
      ),
      body: BlocProvider<MoviesListBloc>(
        builder: (context) {
          MovieRepository repository = RepositoryProvider.of<MovieRepository>(context);
          return MoviesListBloc(movieRepository: repository)..dispatch(Fetch());
        },
        child: MoviesList(),
      ),
    );
  }
}
