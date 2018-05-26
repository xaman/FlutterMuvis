// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

DetailEntity _$DetailEntityFromJson(Map<String, dynamic> json) =>
    new DetailEntity()
      ..budget = json['budget'] as int
      ..homepage = json['homepage'] as String
      ..imdbId = json['imdb_id'] as String
      ..originalLanguage = json['original_language'] as String
      ..originalTitle = json['original_title'] as String
      ..overview = json['overview'] as String
      ..runtime = json['runtime'] as int
      ..genres = (json['genres'] as List)
          ?.map((e) => e == null
              ? null
              : new GenreEntity.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..countries = (json['production_countries'] as List)
          ?.map((e) => e == null
              ? null
              : new CountryEntity.fromJson(e as Map<String, dynamic>))
          ?.toList();

abstract class _$DetailEntitySerializerMixin {
  int get budget;
  String get homepage;
  String get imdbId;
  String get originalLanguage;
  String get originalTitle;
  String get overview;
  int get runtime;
  List<GenreEntity> get genres;
  List<CountryEntity> get countries;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'budget': budget,
        'homepage': homepage,
        'imdb_id': imdbId,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'runtime': runtime,
        'genres': genres,
        'production_countries': countries
      };
}
