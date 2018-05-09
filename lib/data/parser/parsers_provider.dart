import 'package:fluttermuvis/data/parser/movie_parser.dart';
import 'package:fluttermuvis/data/parser/detail_parser.dart';
import 'package:fluttermuvis/data/parser/genres_parser.dart';
import 'package:fluttermuvis/data/parser/countries_parser.dart';

class ParsersProvider {

  static MoviesParser getMoviesParser() {
    return new MoviesParser();
  }

  static DetailParser getDetailParser() {
    return new DetailParser(_getGenresParser(), _getCountriesParser());
  }

  static GenresParser _getGenresParser() {
    return new GenresParser();
  }

  static CountriesParser _getCountriesParser() {
    return new CountriesParser();
  }

}