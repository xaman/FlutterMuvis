import 'package:fluttermuvis/data/entity/cast_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credits_response.g.dart';

@JsonSerializable()
class CreditsResponse extends Object with _$CreditsResponseSerializerMixin {

  @JsonKey(name: 'cast')
  List<CastEntity> credits;

  CreditsResponse();

  factory CreditsResponse.fromJson(Map<String, dynamic> json) => _$CreditsResponseFromJson(json);

}