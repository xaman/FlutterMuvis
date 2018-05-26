// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

GenreEntity _$GenreEntityFromJson(Map<String, dynamic> json) =>
    new GenreEntity()
      ..id = json['id'] as int
      ..name = json['name'] as String;

abstract class _$GenreEntitySerializerMixin {
  int get id;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'name': name};
}
