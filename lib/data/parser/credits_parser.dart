import 'dart:convert';

import 'package:fluttermuvis/data/parser/parser.dart';
import 'package:fluttermuvis/domain/model/cast.dart';

class CreditsParser extends Parser<List<Cast>> {
  @override
  List<Cast> parse(String jsonString) {
    List<Cast> result = new List<Cast>();
    var responseJson = json.decode(jsonString);
    for (var castJson in responseJson["cast"]) {
      try {
        var cast = _parseCast(castJson);
        result.add(cast);
      } catch (exception) {
        print(exception.toString());
      }
    }
    return result;
  }

  Cast _parseCast(dynamic castJson) {
    return new Cast (
      castJson["character"],
      castJson["name"],
      castJson["profile_path"]
    );
  }

}