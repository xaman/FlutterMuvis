import 'dart:async';

import 'package:http/http.dart' as http;

import '../config.dart';

import 'movies_parser.dart';

import '../domain/model/movie.dart';


class Api {

  MoviesParser _moviesParser = new MoviesParser();

  Future<List<Movie>> getMovies(int year, int page) {

    String url = Config.DOMAIN + "/3/discover/movie/?" +
        "api_key=" + Config.TMD_API_KEY +
        "&primary_release_year=" + year.toString() +
        "&page=" + page.toString();

    return http.get(url)
        .then((response) => response.body)
        .then((body) => _moviesParser.parse(body));
  }

}