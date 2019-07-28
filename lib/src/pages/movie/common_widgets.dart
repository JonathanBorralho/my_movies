import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movies/src/models/movie_model.dart';

class IconButtonWithLabel extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function onPressed;

  IconButtonWithLabel({this.label, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: icon,
          ),
          Text(label),
        ],
      ),
      onTap: onPressed,
    );
  }
}

class MoreInfo extends StatelessWidget {
  final Movie movie;

  MoreInfo(this.movie);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          '${(movie.voteAverage * 10).round()}% relevante',
          style: TextStyle(color: Colors.green),
        ),
        Text(DateTime.parse(movie.releaseDate).year.toString()),
        Text('12'),
        Text('2h 12'),
      ],
    );
  }
}

class Overview extends StatelessWidget {
  final String overview;

  Overview(this.overview);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Elenco: Mads Mikkensen, vanessa Hudgens, Katheryn Winnick',
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Direção: Jonas Akerlund',
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WatchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 8.0, right: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.play_arrow),
                  Text('Assistir'),
                ],
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class Poster extends StatelessWidget {
  final Movie movie;

  Poster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Hero(
        tag: movie.id,
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(
                  4.0,
                  5.0,
                ),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              image: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              ).image,
            ),
          ),
        ),
      ),
    );
  }
}

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButtonWithLabel(
            label: 'Minha lista',
            icon: Icon(Icons.check),
            onPressed: () {},
          ),
          IconButtonWithLabel(
            label: 'Classifique',
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          IconButtonWithLabel(
            label: 'Compartilhe',
            icon: Icon(CupertinoIcons.share),
            onPressed: () {},
          ),
          IconButtonWithLabel(
            label: 'Baixar',
            icon: Icon(Icons.file_download),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
