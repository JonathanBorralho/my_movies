import 'package:json_annotation/json_annotation.dart';
import 'package:my_movies/src/models/movie_model.dart';

part 'movie_response_page.g.dart';

@JsonSerializable(createToJson: false)
class MovieResponsePage {
  final int page;

  @JsonKey(name: 'total_results')
  final int totalResults;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'results')
  List<Movie> movies;

  MovieResponsePage({
    this.page,
    this.totalResults,
    this.totalPages,
    List<Movie> movies,
  }) : movies = movies ?? <Movie>[];

  factory MovieResponsePage.fromJson(Map<String, dynamic> json) => _$MovieResponsePageFromJson(json);
}
