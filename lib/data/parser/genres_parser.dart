import 'dart:convert';

import 'package:fluttermuvis/data/parser/parser.dart';
import 'package:fluttermuvis/domain/model/genre.dart';

class GenresParser extends Parser<List<Genre>> {
  @override
  List<Genre> parse(String jsonString) {
    List<Genre> result = new List<Genre>();
    var responseJson = json.decode(jsonString);
    for (var genreJson in responseJson["genres"]) {
      try {
        var genre = _parseGenre(genreJson);
        result.add(genre);
      } catch (exception) {
        print(exception.toString());
      }
    }
    return result;
  }

  Genre _parseGenre(dynamic genreJson) {
    return new Genre(
      genreJson["id"],
      genreJson["name"]
    );
  }
}