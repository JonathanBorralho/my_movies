import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:my_movies/src/models/movie_model.dart';
import 'package:my_movies/src/models/movie_response_page.dart';

class MovieRepository {
  final String _apiKey = '5ea66116adf9299cc57dc1eacc39f2c6';
  final String _baseUrl = 'api.themoviedb.org';
  final _cache = Map<String, List<Movie>>();

  Future<List<Movie>> findAll() async {
    final uri = Uri.https(
      _baseUrl,
      '/3/movie/popular',
      {
        'api_key': _apiKey,
        'language': 'pt-BR',
      },
    );
    http.Response response = await http.get(uri);
    if (response.statusCode != 200) throw Exception();
    Map<String, dynamic> body = convert.jsonDecode(response.body);
    MovieResponsePage page = MovieResponsePage.fromJson(body);
    return page.movies;
  }

  Future<List<Movie>> search(String query) async {
    if (_cache.containsKey(query)) {
      return _cache[query];
    } else {
      final uri = Uri.https(_baseUrl, '/3/search/movie', {
        'api_key': _apiKey,
        'query': query,
        'language': 'pt-BR',
      });
      http.Response response = await http.get(uri);
      if (response.statusCode != 200) throw Exception();
      Map<String, dynamic> body = convert.jsonDecode(response.body);
      MovieResponsePage page = MovieResponsePage.fromJson(body);
      _cache[query] = page.movies;
      return page.movies;
    }
  }
}
