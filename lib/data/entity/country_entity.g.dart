// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

CountryEntity _$CountryEntityFromJson(Map<String, dynamic> json) =>
    new CountryEntity()
      ..iso = json['iso_3166_1'] as String
      ..name = json['name'] as String;

abstract class _$CountryEntitySerializerMixin {
  String get iso;
  String get name;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'iso_3166_1': iso, 'name': name};
}
