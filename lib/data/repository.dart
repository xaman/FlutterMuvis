import 'dart:async';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:fluttermuvis/domain/model/cast.dart';

abstract class Repository {

  Future<List<Movie>> getMovies(int page);

  Future<Detail> getDetail(int id);

  Future<List<Cast>> getCredits(int id);

  Future<Movie> setFavorite(Movie movie);

}