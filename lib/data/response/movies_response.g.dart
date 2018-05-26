// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    new MoviesResponse()
      ..movies = (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : new MovieEntity.fromJson(e as Map<String, dynamic>))
          ?.toList();

abstract class _$MoviesResponseSerializerMixin {
  List<MovieEntity> get movies;
  Map<String, dynamic> toJson() => <String, dynamic>{'results': movies};
}
