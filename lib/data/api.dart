import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:fluttermuvis/config.dart';
import 'package:fluttermuvis/data/parser/movie_parser.dart';
import 'package:fluttermuvis/data/parser/detail_parser.dart';
import 'package:fluttermuvis/data/parser/credits_parser.dart';
import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:fluttermuvis/domain/model/cast.dart';

const String TAG = "[API]";

class Api {

  MoviesParser _moviesParser;
  DetailParser _detailParser;
  CreditsParser _creditsParser;

  Api(this._moviesParser, this._detailParser, this._creditsParser);

  Future<List<Movie>> getMovies(int year, int page) {
    String url = Config.DOMAIN + "/3/discover/movie/?" +
      "api_key=" + Config.TMD_API_KEY +
      "&primary_release_year=" + year.toString() +
      "&page=" + page.toString();
    return _get(url).then((body) => _moviesParser.parse(body));
  }

  Future<Detail> getMovieDetail(int id) {
    String url = Config.DOMAIN + "/3/movie/" + id.toString() +
      "?api_key=" + Config.TMD_API_KEY;
    return _get(url).then((body) => _detailParser.parse(body));
  }

  Future<List<Cast>> getCredits(int id) {
    String url = Config.DOMAIN + "/3/movie/" + id.toString() + "/credits" +
      "?api_key=" + Config.TMD_API_KEY;
    return _get(url).then((body) => _creditsParser.parse(body));
  }

  Future<String> _get(String url) {
    return http.get(url).then((response) {
      if (Config.DEBUG) print("$TAG ${response.body}");
      return response.body;
    });
  }

}