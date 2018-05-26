import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity extends Object with _$MovieEntitySerializerMixin {

  MovieEntity();

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'overview')
  String overview;

  @JsonKey(name: 'release_date')
  String releaseDate;

  @JsonKey(name: 'adult')
  bool forAdults;

  @JsonKey(name: 'popularity')
  double popularity;

  @JsonKey(name: 'vote_count')
  int votesCount;

  @JsonKey(name: 'vote_average')
  num votesAverage;

  @JsonKey(name: 'poster_path')
  String posterPath;

  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  factory MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);

  Movie toDomain() => new Movie(
    id,
    title,
    originalTitle,
    originalLanguage,
    overview,
    releaseDate,
    forAdults,
    popularity,
    votesCount,
    votesAverage,
    posterPath,
    backdropPath,
    false,
    null
  );
}