import 'package:my_movies/src/models/movie_model.dart';

class SearchCache {
  final _cache = Map<String, List<Movie>>();

  List<Movie> get(String term) => _cache[term];

  void set(String term, List<Movie> result) => _cache[term] = result;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
