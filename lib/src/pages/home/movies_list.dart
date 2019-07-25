import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movies_list/bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';

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
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w154${movies[index].posterPath}',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
