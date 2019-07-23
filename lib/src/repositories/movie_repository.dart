import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:my_movies/src/models/movie_model.dart';
import 'package:my_movies/src/models/movie_response_page.dart';

class MovieRepository {
  final String _apiKey = '5ea66116adf9299cc57dc1eacc39f2c6';

  Future<List<Movie>> findAll() async {
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=pt-BR';
    http.Response response = await http.get(url);
    Map<String, dynamic> body = convert.jsonDecode(response.body);
    MovieResponsePage page = MovieResponsePage.fromJson(body);
    return page.movies;
  }
}
