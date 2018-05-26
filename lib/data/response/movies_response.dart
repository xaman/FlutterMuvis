import 'package:fluttermuvis/data/entity/movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse extends Object with _$MoviesResponseSerializerMixin {

  @JsonKey(name: 'results')
  List<MovieEntity> movies;

  MoviesResponse();

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);

}
