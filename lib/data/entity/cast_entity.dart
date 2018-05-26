import 'package:fluttermuvis/domain/model/cast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast_entity.g.dart';

@JsonSerializable()
class CastEntity extends Object with _$CastEntitySerializerMixin {

  @JsonKey(name: 'character')
  String character;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'profile_path')
  String profilePath;

  CastEntity();

  factory CastEntity.fromJson(Map<String, dynamic> json) => _$CastEntityFromJson(json);

  Cast toDomain() => new Cast(
    character,
    name,
    profilePath
  );

}
