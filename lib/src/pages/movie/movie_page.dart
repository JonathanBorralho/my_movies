import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movies/src/models/movie_model.dart';

import 'common_widgets.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;

  MoviePage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Poster(movie),
              MoreInfo(movie),
              WatchButton(),
              Overview(movie.overview),
              Credits(),
              ActionBar(),
            ],
          ),
        ),
      ),
    );
  }
}
