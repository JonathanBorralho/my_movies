import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final int id;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  final bool video;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  final String title;

  final double popularity;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIds = [];

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  final bool adult;

  final String overview;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  Movie({
    this.id,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
    List<int> genreIds
  }) : super([
          id,
          voteCount,
          video,
          voteAverage,
          title,
          popularity,
          posterPath,
          originalLanguage,
          originalTitle,
          backdropPath,
          adult,
          overview,
          releaseDate,
          genreIds,
        ]);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
