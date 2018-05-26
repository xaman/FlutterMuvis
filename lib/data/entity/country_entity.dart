import 'package:fluttermuvis/domain/model/country.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class CountryEntity extends Object with _$CountryEntitySerializerMixin {

  @JsonKey(name: 'iso_3166_1')
  String iso;

  @JsonKey(name: 'name')
  String name;

  CountryEntity();

  factory CountryEntity.fromJson(Map<String, dynamic> json) => _$CountryEntityFromJson(json);

  Country toDomain() => new Country(
    iso,
    name
  );

}