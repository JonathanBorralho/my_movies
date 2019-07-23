import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/src/models/movie_model.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MovieRepository repo = RepositoryProvider.of<MovieRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Melhores Filmes'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: repo.findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot.data);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildList(List<Movie> movies) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${movies[index].posterPath}',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
