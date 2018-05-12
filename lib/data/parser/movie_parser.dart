import 'dart:convert';

import 'package:fluttermuvis/data/parser/parser.dart';
import 'package:fluttermuvis/domain/model/movie.dart';

class MoviesParser extends Parser<List<Movie>> {
  @override
  List<Movie> parse(String jsonString) {
    List<Movie> result = new List<Movie>();
    var responseJson = json.decode(jsonString);
    for (var movieJson in responseJson["results"]) {
      try {
        var movie = _parseMovie(movieJson);
        result.add(movie);
      } catch (exception) {
        print("[MoviesParser] $exception $movieJson");
      }
    }
    return result;
  }

  Movie _parseMovie(dynamic movieJson) {
    return new Movie (
      movieJson["id"],
      movieJson["title"],
      movieJson["original_title"],
      movieJson["original_language"],
      movieJson["overview"],
      movieJson["release_date"],
      movieJson["adult"],
      movieJson["popularity"],
      movieJson["vote_count"],
      movieJson["vote_average"],
      movieJson["poster_path"],
      movieJson["backdrop_path"],
      false,
      null
    );
  }

}