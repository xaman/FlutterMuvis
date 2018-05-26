// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

CastEntity _$CastEntityFromJson(Map<String, dynamic> json) => new CastEntity()
  ..character = json['character'] as String
  ..name = json['name'] as String
  ..profilePath = json['profile_path'] as String;

abstract class _$CastEntitySerializerMixin {
  String get character;
  String get name;
  String get profilePath;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'character': character,
        'name': name,
        'profile_path': profilePath
      };
}
