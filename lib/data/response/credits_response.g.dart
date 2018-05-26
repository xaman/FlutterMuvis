// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

CreditsResponse _$CreditsResponseFromJson(Map<String, dynamic> json) =>
    new CreditsResponse()
      ..credits = (json['cast'] as List)
          ?.map((e) => e == null
              ? null
              : new CastEntity.fromJson(e as Map<String, dynamic>))
          ?.toList();

abstract class _$CreditsResponseSerializerMixin {
  List<CastEntity> get credits;
  Map<String, dynamic> toJson() => <String, dynamic>{'cast': credits};
}
