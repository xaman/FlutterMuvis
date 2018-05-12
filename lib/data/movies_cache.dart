import 'package:fluttermuvis/data/cache.dart';
import 'package:fluttermuvis/domain/model/movie.dart';

class MoviesCache implements Cache<Movie> {

  Map<int, Movie> content;

  MoviesCache() {
    content = new Map();
  }

  @override
  bool isEmpty() => content.isEmpty;

  @override
  List<Movie> getAll() => content.values.toList();

  @override
  Movie getById(int id) => content[id];

  @override
  void putAll(List<Movie> values) => values.forEach(put);

  @override
  void put(Movie value) => content[value.id] = value;

  @override
  void clear() => content.clear();

}