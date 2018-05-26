import 'package:fluttermuvis/data/entity/country_entity.dart';
import 'package:fluttermuvis/data/entity/genre_entity.dart';
import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_entity.g.dart';

@JsonSerializable()
class DetailEntity extends Object with _$DetailEntitySerializerMixin {

  @JsonKey(name: 'budget')
  int budget;

  @JsonKey(name: 'homepage')
  String homepage;

  @JsonKey(name: 'imdb_id')
  String imdbId;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'overview')
  String overview;

  @JsonKey(name: 'runtime')
  int runtime;

  @JsonKey(name: 'genres')
  List<GenreEntity> genres;

  @JsonKey(name: 'production_countries')
  List<CountryEntity> countries;

  DetailEntity();

  factory DetailEntity.fromJson(Map<String, dynamic> json) => _$DetailEntityFromJson(json);

  Detail toDomain() => new Detail(
      budget,
      homepage,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      runtime,
      genres?.map((it) => it.toDomain()),
      countries?.map((it) => it.toDomain()));
}
