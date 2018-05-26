// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) =>
    new MovieEntity()
      ..id = json['id'] as int
      ..title = json['title'] as String
      ..originalTitle = json['original_title'] as String
      ..originalLanguage = json['original_language'] as String
      ..overview = json['overview'] as String
      ..releaseDate = json['release_date'] as String
      ..forAdults = json['adult'] as bool
      ..popularity = (json['popularity'] as num)?.toDouble()
      ..votesCount = json['vote_count'] as int
      ..votesAverage = json['vote_average'] as num
      ..posterPath = json['poster_path'] as String
      ..backdropPath = json['backdrop_path'] as String;

abstract class _$MovieEntitySerializerMixin {
  int get id;
  String get title;
  String get originalTitle;
  String get originalLanguage;
  String get overview;
  String get releaseDate;
  bool get forAdults;
  double get popularity;
  int get votesCount;
  num get votesAverage;
  String get posterPath;
  String get backdropPath;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'original_title': originalTitle,
        'original_language': originalLanguage,
        'overview': overview,
        'release_date': releaseDate,
        'adult': forAdults,
        'popularity': popularity,
        'vote_count': votesCount,
        'vote_average': votesAverage,
        'poster_path': posterPath,
        'backdrop_path': backdropPath
      };
}
