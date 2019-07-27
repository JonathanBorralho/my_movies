import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movie_search/bloc.dart';
import 'package:my_movies/src/blocs/movies_list/bloc.dart';
import 'package:my_movies/src/pages/home/movie_search_delegate.dart';
import 'package:my_movies/src/pages/home/movies_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<MovieSearchBloc>(context);
    final moviesListBloc = BlocProvider.of<MoviesListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Melhores Filmes')),
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            moviesListBloc.dispatch(Fetch());
          },
        ),
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
      body: MoviesList(),
    );
  }
}
