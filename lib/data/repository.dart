import 'dart:async';

import 'api.dart';

import '../domain/model/movie.dart';

const int _DEFAULT_YEAR = 2017;
const int _DEFAULT_PAGE = 1;

class Repository {

  Api _api;

  Repository(this._api);

  Future<List<Movie>> getMovies() => _api.getMovies(_DEFAULT_YEAR, _DEFAULT_PAGE);

}