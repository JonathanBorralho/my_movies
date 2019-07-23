// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponsePage _$MovieResponsePageFromJson(Map<String, dynamic> json) {
  return MovieResponsePage(
    page: json['page'] as int,
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
    movies: (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
