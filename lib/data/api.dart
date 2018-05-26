import 'dart:async';
import 'dart:convert';

import 'package:fluttermuvis/data/entity/cast_entity.dart';
import 'package:fluttermuvis/data/entity/detail_entity.dart';
import 'package:fluttermuvis/data/response/credits_response.dart';
import 'package:fluttermuvis/data/response/movies_response.dart';
import 'package:http/http.dart' as http;

import 'package:fluttermuvis/config.dart';
import 'package:fluttermuvis/data/entity/movie_entity.dart';

const String TAG = "[API]";

class Api {

  Api();

  Future<List<MovieEntity>> getMovies(int year, int page) {
    String url = Config.DOMAIN + "/3/discover/movie/?" +
      "api_key=" + Config.TMD_API_KEY +
      "&primary_release_year=" + year.toString() +
      "&page=" + page.toString();
    return _get(url).then((json) => _parseMovies(json));
  }

  List<MovieEntity> _parseMovies(Map<String, dynamic> json) {
    return MoviesResponse.fromJson(json)?.movies ?? new List();
  }

  Future<DetailEntity> getMovieDetail(int id) {
    String url = Config.DOMAIN + "/3/movie/" + id.toString() +
      "?api_key=" + Config.TMD_API_KEY;
    return _get(url).then((json) => DetailEntity.fromJson(json));
  }

  Future<List<CastEntity>> getCredits(int id) {
    String url = Config.DOMAIN + "/3/movie/" + id.toString() + "/credits" +
      "?api_key=" + Config.TMD_API_KEY;
    return _get(url).then((json) => _parseCredits(json));
  }

  List<CastEntity> _parseCredits(Map<String, dynamic> json) {
    return CreditsResponse.fromJson(json)?.credits ?? new List();
  }

  Future<Map<String, dynamic>> _get(String url) {
    return http.get(url).then((response) {
      if (Config.DEBUG) print("$TAG ${response.body}");
      return json.decode(response.body);
    });
  }

}