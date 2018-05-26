import 'package:fluttermuvis/domain/model/genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_entity.g.dart';

@JsonSerializable()
class GenreEntity extends Object with _$GenreEntitySerializerMixin {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  GenreEntity();

  factory GenreEntity.fromJson(Map<String, dynamic> json) => _$GenreEntityFromJson(json);

  Genre toDomain() => new Genre(
    id,
    name
  );

}
