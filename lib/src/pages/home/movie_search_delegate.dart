import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/blocs/movie_search/bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';

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
    if (query.isNotEmpty) {
      searchBloc.dispatch(Search(query: query));
    }
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
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  Widget _buildList(List<Movie> movies) {
    return movies.isNotEmpty
        ? GridView.builder(
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
          )
        : Center(child: Text('Sem resultados...'));
  }
}
