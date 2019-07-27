import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movies_list/bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';

import 'movie_widgets.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListBloc, MoviesListState>(
      builder: (context, state) {
        if (state is Loaded) {
          return _buildList(state.movies);
        }

        if (state is Failure) {
          return Center(
            child: Text(state.message),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildList(List<Movie> movies) {
    return movies.isNotEmpty
        ? MovieCardList(movies)
        : Center(child: Text('Sem resultados...'));
  }
}
