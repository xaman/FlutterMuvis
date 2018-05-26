import 'dart:async';

import 'package:fluttermuvis/data/api.dart';
import 'package:fluttermuvis/data/cache.dart';
import 'package:fluttermuvis/data/entity/movie_entity.dart';
import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:fluttermuvis/domain/model/cast.dart';

const int _DEFAULT_YEAR = 2017;

class RepositoryImpl extends Repository {

  Api _api;
  Cache<MovieEntity> _cache;

  RepositoryImpl(this._api, this._cache);

  Future<List<Movie>> getMovies(int page) {
    return _api.getMovies(_DEFAULT_YEAR, page)
      .then((entities) {
        _cache.putAll(entities);
        return entities
          .map((entity) => entity.toDomain())
          .toList();
      });
  }

  Future<Detail> getDetail(int id) => _api.getMovieDetail(id)
      .then((entity) => entity.toDomain());

  Future<List<Cast>> getCredits(int id) => _api.getCredits(id)
    .then((entities) {
      return entities.map((it) => it.toDomain()).toList();
    });

  Future<Movie> setFavorite(Movie movie) {
    return new Future(() => movie.clone(favorite: !movie.isFavorite));
  }

}