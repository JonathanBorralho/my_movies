import 'package:flutter/material.dart';
import 'package:my_movies/src/models/movie_model.dart';
import 'package:my_movies/src/pages/movie/movie_page.dart';

class MovieCardList extends StatelessWidget {
  final List<Movie> movies;

  MovieCardList(this.movies);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MoviePage(movies[index])),
            );
          },
          child: MovieCardItem(movies[index]),
        );
      },
    );
  }
}

class MovieCardItem extends StatelessWidget {
  final Movie movie;

  MovieCardItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Hero(
        tag: movie.id,
        child: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
