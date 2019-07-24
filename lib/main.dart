import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:my_movies/src/pages/home_page.dart';
import 'package:my_movies/src/repositories/movie_repository.dart';
import 'package:my_movies/src/util/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movies',
      theme: ThemeData.dark(),
      home: RepositoryProvider(
        builder: (context) => MovieRepository(),
        child: HomePage(),
      ),
    );
  }
}
