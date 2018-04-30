import 'dart:async';

import 'api.dart';

import '../domain/model/movie.dart';

const int _DEFAULT_YEAR = 2017;

class Repository {

  Api _api;

  Repository(this._api);

  Future<List<Movie>> getMovies(int page) => _api.getMovies(_DEFAULT_YEAR, page);

}