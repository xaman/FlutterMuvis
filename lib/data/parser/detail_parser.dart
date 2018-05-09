import 'dart:convert';

import 'package:fluttermuvis/data/parser/parser.dart';
import 'package:fluttermuvis/data/parser/genres_parser.dart';
import 'package:fluttermuvis/data/parser/countries_parser.dart';
import 'package:fluttermuvis/domain/model/detail.dart';

class DetailParser extends Parser<Detail> {

  GenresParser _genresParser;
  CountriesParser _countriesParser;

  DetailParser(this._genresParser, this._countriesParser);

  @override
  Detail parse(String jsonString) {
    var responseJson = json.decode(jsonString);
    return new Detail(
      responseJson["budget"],
      responseJson["homepage"],
      responseJson["imdb_id"],
      responseJson["original_language"],
      responseJson["original_title"],
      responseJson["overview"],
      responseJson["runtime"],
      _genresParser.parse(jsonString),
      _countriesParser.parse(jsonString)
    );
  }

}
