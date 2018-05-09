import 'dart:convert';

import 'package:fluttermuvis/data/parser/parser.dart';
import 'package:fluttermuvis/domain/model/country.dart';

class CountriesParser extends Parser<List<Country>> {
  @override
  List<Country> parse(String jsonString) {
    List<Country> result = new List<Country>();
    var responseJson = json.decode(jsonString);
    for (var countryJson in responseJson["production_countries"]) {
      try {
        var country = _parseCountry(countryJson);
        result.add(country);
      } catch (exception) {
        print(exception.toString());
      }
    }
    return result;
  }

  Country _parseCountry(dynamic countryJson) {
    return new Country(
      countryJson["iso_3166_1"],
      countryJson["name"]
    );
  }

}