import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movie_search/bloc.dart';
import 'package:my_movies/src/blocs/movies_list/bloc.dart';
import 'package:my_movies/src/pages/home/movie_search_delegate.dart';
import 'package:my_movies/src/pages/home/movies_list.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieRepository repository = RepositoryProvider.of<MovieRepository>(context);
    final MovieSearchBloc searchBloc = MovieSearchBloc(movieRepository: repository);
    return Scaffold(
      appBar: AppBar(
        title: Text('Melhores Filmes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MovieSearchDelegate(searchBloc: searchBloc),
              );
            },
          ),
        ],
      ),
      body: BlocProvider<MoviesListBloc>(
        builder: (context) {
          MovieRepository repository =
              RepositoryProvider.of<MovieRepository>(context);
          return MoviesListBloc(movieRepository: repository)..dispatch(Fetch());
        },
        child: MoviesList(),
      ),
    );
  }
}
