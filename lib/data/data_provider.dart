import 'package:fluttermuvis/data/cache.dart';
import 'package:fluttermuvis/data/entity/movie_entity.dart';
import 'package:fluttermuvis/data/movies_cache.dart';
import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/data/repository_impl.dart';
import 'package:fluttermuvis/data/api.dart';

class DataProvider {

  static Repository _repository;

  static Repository getRepository() {
    if (_repository == null) {
      _repository = new RepositoryImpl(_createApi(), _createCache());
    }
    return _repository;
  }

  static Api _createApi() => new Api();

  static Cache<MovieEntity> _createCache() => new MoviesCache();

}