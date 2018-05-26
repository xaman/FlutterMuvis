import 'package:fluttermuvis/data/cache.dart';
import 'package:fluttermuvis/data/entity/movie_entity.dart';

class MoviesCache implements Cache<MovieEntity> {

  Map<int, MovieEntity> content;

  MoviesCache() {
    content = new Map();
  }

  @override
  bool isEmpty() => content.isEmpty;

  @override
  List<MovieEntity> getAll() => content.values.toList();

  @override
  MovieEntity getById(int id) => content[id];

  @override
  void putAll(List<MovieEntity> values) => values.forEach(put);

  @override
  void put(MovieEntity value) => content[value.id] = value;

  @override
  void clear() => content.clear();

}