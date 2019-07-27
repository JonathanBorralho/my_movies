import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movie_search/bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';

import 'movie_widgets.dart';

class MovieSearchDelegate extends SearchDelegate {
  final MovieSearchBloc searchBloc;

  MovieSearchDelegate({this.searchBloc});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          this.query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.dispatch(SearchButtonPressed(query: query));

    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchStateEmpty) {
          return Container();
        }

        if (state is SearchStateSuccess) {
          return _buildList(state.movies);
        }

        if (state is SearchStateError) {
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

  @override
  Widget buildSuggestions(BuildContext context) => Container();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  Widget _buildList(List<Movie> movies) {
    return movies.isNotEmpty
        ? MovieCardList(movies)
        : Center(child: Text('Sem resultados...'));
  }
}
