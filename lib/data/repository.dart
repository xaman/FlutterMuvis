import 'dart:async';

import 'package:fluttermuvis/data/api.dart';
import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/model/detail.dart';

const int _DEFAULT_YEAR = 2017;

class Repository {

  Api _api;

  Repository(this._api);

  Future<List<Movie>> getMovies(int page) => _api.getMovies(_DEFAULT_YEAR, page);

  Future<Detail> getDetail(int id) => _api.getMovieDetail(id);

}